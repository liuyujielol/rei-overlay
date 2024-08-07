# Copyright 2022-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

if [[ ${PV} = *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/dfaust/${PN}.git"
	inherit git-r3
else
	SRC_URI="https://github.com/dfaust/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Plasma 5 widget that displays the currently used network bandwidth."
HOMEPAGE="https://www.kde-look.org/p/998895/
https://github.com/dfaust/plasma-applet-netspeed-widget"

LICENSE="GPL-2+"
SLOT="6"

DEPEND="
	app-alternatives/awk
	>=kde-plasma/kdeplasma-addons-6.0:6
	>=kde-plasma/libplasma-6.0:6
"
RDEPEND="${DEPEND}"

DOCS=( README.md )
