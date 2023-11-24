# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit qmake-utils

DESCRIPTION="Qt Publish and Subscribe Add-on Module"
HOMEPAGE="https://github.com/qt/qtsystems"
ECOMMIT="81e08ee508d0a49c588705cc9c47568b09a258db"
#ECOMMIT="e3332ee38d27a134cef6621fdaf36687af1b6f4a"
SRC_URI="
	https://github.com/qt/qtsystems/archive/${ECOMMIT}.tar.gz -> ${P}-${ECOMMIT}.tar.gz
"
S="${WORKDIR}/${PN}-${ECOMMIT}"

LICENSE="GPL-3 LGPL-3 FDL-1.3+"
SLOT="5"
KEYWORDS="~amd64"

DEPEND="
	net-wireless/bluez
	dev-qt/qtdeclarative:5
"
RDEPEND="${DEPEND}"

src_compile() {
	eqmake5 CONFIG+=git_build
	emake
}

src_install() {
	emake INSTALL_ROOT="${ED}" install
}
