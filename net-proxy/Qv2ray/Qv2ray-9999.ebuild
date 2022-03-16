# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake xdg

DESCRIPTION="A cross platform connection manager for V2Ray and other backends"
HOMEPAGE="https://github.com/Shadowsocks-NET/Qv2ray"

EGIT_REPO_URI="${HOMEPAGE}"
EGIT_BRANCH="main"

LICENSE="GPL-3 MIT"
SLOT="0"
# there's no QT6 in Gentoo main tree yet
KEYWORDS=""

DEPEND="
	dev-qt/qtcore:6
	dev-qt/qtgui:6
	dev-qt/qtnetwork:6
	dev-qt/qtwidgets:6
	dev-qt/qtsvg:6
	net-libs/grpc
	net-proxy/v2ray
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_unpack() {
	git-r3_src_unpack
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="/usr"
		-DQV2RAY_AUTO_UPDATE=OFF
		-DQV2RAY_BUILD_INFO="qv2ray Gentoo"
		-DQV2RAY_BUILD_EXTRA_INFO="r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
		-DQV2RAY_DEFAULT_VASSETS_PATH="/usr/share/v2ray"
		-DQV2RAY_DEFAULT_VCORE_PATH="/usr/bin/v2ray"
#		-DQV2RAY_QV2RAYBASE_PROVIDER=package
	)
	cmake_src_configure
}
