# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby30"
inherit ruby-single qmake-utils desktop xdg

DESCRIPTION="Git GUI Client"
HOMEPAGE="https://soramimi.github.io/Guitar/"
SRC_URI="https://github.com/soramimi/Guitar/archive/refs/tags/v1.2.0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

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

MY_PN="Guitar"
S="${WORKDIR}/${MY_PN}-${PV}"

src_compile() {
	mkdir _bin || die
	eqmake5 -o Makefile Guitar.pro CONFIG+=release PREFIX=/usr CONFIG+=use_system_zlib
	emake
}

src_install() {
	dobin _bin/Guitar
	domenu "${FILESDIR}/guitar.desktop"
	doicon -s scalable LinuxDesktop/Guitar.svg
}
