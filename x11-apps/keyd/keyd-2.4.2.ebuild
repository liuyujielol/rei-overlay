# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit python-single-r1 systemd optfeature

DESCRIPTION="A key remapping daemon for linux"
HOMEPAGE="https://github.com/rvaiya/keyd"
SRC_URI="https://github.com/rvaiya/keyd/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+man elibc_musl"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	acct-group/keyd
	${PYTHON_DEPS}
"
RDEPEND="${DEPEND}"
BDEPEND="
	man? ( app-text/scdoc )
"

src_prepare() {
	local PATCHES=(
		"${FILESDIR}/fix-makefile.patch"
	)
	if use elibc_musl; then
		PATCHES+=(
			"${FILESDIR}/musl-time64.patch"
		)
	fi
	default
}

src_compile() {
	emake
	if use man; then
		emake man
	fi
}

src_install() {
	dobin bin/*

	local DOCS=(
		docs/CHANGELOG.md docs/DESIGN.md
	)
	einstalldocs

	insinto "/usr/share/doc/${P}/examples"
	doins -r examples/*

	insinto "/usr/share/keyd"
	doins data/keyd.compose
	doins -r layouts

	if has_version dev-libs/libinput; then
		insinto "/usr/share/libinput/"
		newins "${S}"/keyd.quirks 30-keyd.quirks
	fi

	if use man; then
		gzip -d data/*.1.gz || die
		doman data/keyd{,-application-mapper}.1
	fi

	systemd_dounit keyd.service
	newinitd "${FILESDIR}/keyd.initd" keyd
}

pkg_postinst() {
	elog "For information on HOW TO refer to the guide:"
	elog "    https://github.com/rvaiya/keyd#quickstart"

	optfeature "For X support" dev-python/python-xlib
}
