# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby30"
inherit git-r3 ruby-single qmake-utils desktop xdg

EGIT_REPO_URI="https://github.com/soramimi/Guitar.git"
DESCRIPTION="Git GUI Client"
HOMEPAGE="https://soramimi.github.io/Guitar/"

LICENSE="GPL-2"
SLOT="0"
IUSE="qt5 +qt6"
REQUIRED_USE="^^ ( qt5 qt6 )"

DEPEND="
	qt5? (
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtnetwork:5
		dev-qt/qtsvg:5
		dev-qt/linguist-tools:5
	)

	qt6? (
		dev-qt/qtbase:6[gui,network,widgets]
		dev-qt/qt5compat:6
		dev-qt/qtsvg:6
	)

	sys-libs/zlib[static-libs]
	dev-libs/openssl:=
"
RDEPEND="
	${DEPEND}
"
BDEPEND="${RUBY_DEPS}"

src_unpack() {
	git-r3_src_unpack
}

src_configure() {
	if use qt5; then
		eqmake5 CONFIG=release Guitar.pro
	else
		eqmake6 CONFIG=release Guitar.pro
	fi
}

src_install() {
	dobin _bin/Guitar
	domenu "${FILESDIR}/guitar.desktop"
	doicon -s scalable LinuxDesktop/Guitar.svg
}
