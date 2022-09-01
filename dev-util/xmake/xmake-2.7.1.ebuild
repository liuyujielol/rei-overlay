# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A cross-platform build utility based on Lua"
HOMEPAGE="https://xmake.io/"
SRC_URI="https://github.com/xmake-io/xmake/releases/download/v${PV}/xmake-v${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	sys-libs/ncurses:=
	sys-libs/readline:=
"
RDEPEND="${DEPEND}"
BDEPEND=""

# use bundled in src tarball
#IUSE="+lua luajit"
#REQUIRED_USE="|| ( lua luajit )"

S="${WORKDIR}"
RESTRICT="mirror test"

src_compile() {
	emake build
}

src_install() {
	emake install DESTDIR="${D}" PREFIX="/usr"
	doman scripts/man/xmake.1
	doman scripts/man/xrepo.1
	dodoc README.md
}
