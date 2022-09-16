# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CMAKE_MAKEFILE_GENERATOR=emake
inherit flag-o-matic toolchain-funcs cmake xdg

DESCRIPTION="A multi purpose IDE specialized in C/C++/Rust/Python/PHP and Node.js."
HOMEPAGE="https://codelite.org/"

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/eranif/codelite.git"
	EGIT_SUBMODULES=( ctags wxdap )
else
	SRC_URI="
		https://github.com/eranif/codelite/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
		http://repos.codelite.org/wxCrafterLibs/wxgui.zip -> ${PN}-wxgui.zip
	"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="+clang pch nativebook +sftp +lldb php"

DEPEND="
	app-i18n/uchardet
	app-text/hunspell:=
	dev-db/sqlite:3
	dev-libs/glib:2
	net-libs/libssh:=
	x11-libs/gtk+:3
	x11-libs/wxGTK:3.0-gtk3

	lldb? ( >=dev-util/lldb-3.4 )
"
RDEPEND="${DEPEND}"
BDEPEND="
	clang? (
		>=sys-devel/clang-13:=
		>=sys-devel/lld-13
	)
"

pkg_setup() {
	# Show flags set at the beginning
	einfo "Current BINDGEN_CFLAGS:\t${BINDGEN_CFLAGS:-no value set}"
	einfo "Current CFLAGS:\t\t${CFLAGS:-no value set}"
	einfo "Current CXXFLAGS:\t\t${CXXFLAGS:-no value set}"
	einfo "Current LDFLAGS:\t\t${LDFLAGS:-no value set}"

	local have_switched_compiler=
	if use clang && ! tc-is-clang ; then
		# Force clang
		einfo "Enforcing the use of clang due to USE=clang ..."
		have_switched_compiler=yes
		AR=llvm-ar
		AS=llvm-as
		CC=${CHOST}-clang
		CXX=${CHOST}-clang++
		NM=llvm-nm
		RANLIB=llvm-ranlib
		LD=ld.lld
	elif ! use clang && ! tc-is-gcc ; then
		# Force gcc
		have_switched_compiler=yes
		einfo "Enforcing the use of gcc due to USE=-clang ..."
		AR=gcc-ar
		CC=${CHOST}-gcc
		CXX=${CHOST}-g++
		NM=gcc-nm
		RANLIB=gcc-ranlib
		LD=ld.bfd
	fi

	if [[ -n "${have_switched_compiler}" ]] ; then
		# Because we switched active compiler we have to ensure
		# that no unsupported flags are set
		strip-unsupported-flags
	fi

	# Ensure we use correct toolchain
	export HOST_CC="$(tc-getBUILD_CC)"
	export HOST_CXX="$(tc-getBUILD_CXX)"
	tc-export CC CXX LD AR NM OBJDUMP RANLIB
}

src_unpack() {
	unpack "${P}.tar.gz"
	# no need to unpack ${PN}-wxgui.zip
}

src_configure() {
	local mycmakeargs=(
		-DCL_PREFIX=/usr
		-DCOPY_WX_LIBS=0
		-DWITH_PCH=$(usex pch)
		-DWITH_NATIVEBOOK=$(usex nativebook)
		-DENABLE_SFTP=$(usex sftp)
		-DENABLE_LLDB=$(usex lldb)
		-DPHP_BUILD=$(usex php)
		-DWITH_MYSQL=0
		-DMAKE_DEB=0
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	insinto "/usr/share/${PN}"
	newins "${DISTDIR}/${PN}-wxgui.zip" wxgui.zip
}
