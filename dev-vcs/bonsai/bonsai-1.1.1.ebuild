# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
KDE_ORG_CATEGORY="maui"
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm kde.org

DESCRIPTION="Mobile Git repository manager"
HOMEPAGE="https://mauikit.org"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${KDE_ORG_CATEGORY}/${PN}/${PV}/${P}.tar.xz"
	# missing tarball
	#KEYWORDS="~amd64"
fi
LICENSE="GPL-3"
SLOT="5"

DEPEND="
	>=app-misc/mauikit-filebrowsing-3.0.1:5
	>=x11-terms/mauikit-terminal-3.0.1:5
"
RDEPEND="${DEPEND}"
