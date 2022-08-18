# Copyright 2017-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cargo desktop xdg

DESCRIPTION="Lightning-fast and Powerful Code Editor written in Rust"
HOMEPAGE="https://lapce.dev https://github.com/lapce/lapce"

EGIT_REPO_URI="https://github.com/lapce/lapce.git"
#EGIT_COMMIT="6506ef9f0d1a4398f58eb785e84b3fb88489bb0a"

LICENSE="BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions Artistic-2 BSD-2 Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unlicense ZLIB"
SLOT="0"
#KEYWORDS="~amd64"
KEYWORDS=""
IUSE=""

DEPEND="
	media-libs/fontconfig
	media-libs/freetype
	sys-libs/zlib
	x11-libs/libxcb:=
	x11-libs/libxkbcommon
"
BDEPEND="
	>=virtual/rust-1.58.0
"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_install() {
	dobin "target/release/${PN}"
	dobin "target/release/${PN}-proxy"
	domenu "${FILESDIR}/lapce.desktop"
	newicon -s scalable extra/images/logo.svg "${PN}.svg"
}
