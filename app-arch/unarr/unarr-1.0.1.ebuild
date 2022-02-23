# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A decompression library for rar, tar and zip archives"
HOMEPAGE="https://github.com/selmf/unarr"
SRC_URI="https://github.com/selmf/unarr/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="static-libs"

DEPEND="
	sys-libs/zlib
	app-arch/bzip2
	app-arch/xz-utils
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=$(usex static-libs)
	)
	cmake_src_configure
}
