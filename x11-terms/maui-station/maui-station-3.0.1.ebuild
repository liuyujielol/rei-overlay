# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
KDE_ORG_CATEGORY="maui"
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm kde.org

DESCRIPTION="Convergent terminal emulator"
HOMEPAGE="https://mauikit.org"

MY_PN="station"
MY_P="${MY_PN}-${PV}"
if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${KDE_ORG_CATEGORY}/${MY_PN}/${PV}/${MY_P}.tar.xz"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="GPL-3"
SLOT="5"

DEPEND="
	>=app-misc/mauikit-filebrowsing-${PV}:5
	>=x11-terms/mauikit-terminal-${PV}:5
	x11-themes/hicolor-icon-theme
"
RDEPEND="${DEPEND}"
