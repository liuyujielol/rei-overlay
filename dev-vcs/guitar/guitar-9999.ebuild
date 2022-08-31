# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby30"
inherit git-r3 ruby-single qmake-utils desktop xdg

EGIT_REPO_URI="https://github.com/soramimi/Guitar.git"
DESCRIPTION="Git GUI Client"
HOMEPAGE="https://soramimi.github.io/Guitar/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtwidgets:5
	dev-qt/qtnetwork:5
	dev-qt/qtsvg:5
	sys-libs/zlib[static-libs]
	dev-libs/openssl:=
	dev-qt/linguist-tools:5
"
RDEPEND="
	${DEPEND}
"
BDEPEND="${RUBY_DEPS}"

src_unpack() {
	git-r3_src_unpack
}

src_compile() {
	mkdir _bin || die
	eqmake5 -o Makefile Guitar.pro CONFIG+=release PREFIX=/usr
	emake
}

src_install() {
	dobin _bin/Guitar
	domenu "${FILESDIR}/guitar.desktop"
	doicon -s scalable LinuxDesktop/Guitar.svg
}
