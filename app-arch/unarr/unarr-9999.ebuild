# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="A decompression library for rar, tar and zip archives"
HOMEPAGE="https://github.com/selmf/unarr"
#SRC_URI="https://github.com/selmf/unarr/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
EGIT_REPO_URI="https://github.com/selmf/unarr.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+7zip static-libs"

DEPEND="
	sys-libs/zlib
	app-arch/bzip2
	app-arch/xz-utils
	7zip? ( app-arch/p7zip )
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure(){
	local mycmakeargs=(
		-DENABLE_7Z=$(usex 7zip)
		-DBUILD_SHARED_LIBS=$(usex static-libs)
	)
	cmake_src_configure
}
