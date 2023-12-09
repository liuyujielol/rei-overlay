# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES=" "
inherit cargo systemd

DESCRIPTION="Custom protocol, rule based network proxy"
HOMEPAGE="
	https://watfaq.gitbook.io/clashrs-user-manual/
	https://github.com/Watfaq/clash-rs/
"
BORING_CRATE="58d5e7c66b537989bde45d20ce54aff11de1bcea"
LWIP_CRATE="2817bf82740e04bbee6b7bf1165f55657a6ed163"
TUN_CRATE="8f7568190f1200d3e272ca534baf8d1578147e18"
BORINGSSL_COMMIT="410247096a96910339f7ca8aaec479f19316152b"
SRC_URI="
	https://github.com/Watfaq/clash-rs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/google/boringssl/archive/${BORINGSSL_COMMIT}.tar.gz -> boringssl-${BORINGSSL_COMMIT}.gh.tar.gz
"
SRC_URI+="https://github.com/liuyujielol/gentoo-go-deps/releases/download/${P}/${P}-vendor.tar.xz"

LICENSE="Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD-2 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016
	WTFPL-2 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc +lto"
REQUIRED_UES="debug? ( !lto )"

BDEPEND="
	sys-devel/clang
	dev-util/cmake
"

src_unpack() {
	cargo_src_unpack

	rm -rf "${S}/deps/boringssl/src" || die
	ln -sv "${WORKDIR}/boringssl-${BORINGSSL_COMMIT}" "${S}/deps/boringssl/src" || die

	ln -sv "${WORKDIR}/vendor/" "${S}/vendor" || die
	sed -i "${ECARGO_HOME}/config" -e '/source.crates-io/d'  || die
	sed -i "${ECARGO_HOME}/config" -e '/replace-with = "gentoo"/d'  || die
	sed -i "${ECARGO_HOME}/config" -e '/local-registry = "\/nonexistent"/d'  || die
	# cargo vendor no longer generate this file
	#cat "${WORKDIR}/vendor/vendor-config.toml" >> "${ECARGO_HOME}/config" || die
	cat >> "${ECARGO_HOME}/config" <<- _EOF_ || die "Failed to append cargo vendor config"
	[source.crates-io]
	replace-with = "vendored-sources"

	[source."git+https://github.com/Watfaq/boring.git?rev=${BORING_CRATE}"]
	git = "https://github.com/Watfaq/boring.git"
	rev = "${BORING_CRATE}"
	replace-with = "vendored-sources"

	[source."git+https://github.com/Watfaq/netstack-lwip.git?rev=${LWIP_CRATE}"]
	git = "https://github.com/Watfaq/netstack-lwip.git"
	rev = "${LWIP_CRATE}"
	replace-with = "vendored-sources"

	[source."git+https://github.com/Watfaq/rust-tun.git?rev=${TUN_CRATE}"]
	git = "https://github.com/Watfaq/rust-tun.git"
	rev = "${TUN_CRATE}"
	replace-with = "vendored-sources"

	[source.vendored-sources]
	directory = "vendor"
	_EOF_
}

src_compile() {
	if use !debug; then
		# let portage do the strip
		export CARGO_PROFILE_RELEASE_STRIP=false
		if use !lto; then
			export CARGO_PROFILE_RELEASE_LTO=false
		fi
	fi
	cargo_src_compile
}

src_install() {
	insinto "/etc/clash-rs"
	doins "${FILESDIR}/config.example.yaml"
	systemd_dounit "${FILESDIR}/clash-rs.service"

	newbin target/$(usex debug "debug" "release")/clash clash-rs
	use doc && dodoc -r ./docs
}
