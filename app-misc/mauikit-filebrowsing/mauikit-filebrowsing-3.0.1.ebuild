# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
KDE_ORG_CATEGORY="maui"
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm kde.org

DESCRIPTION="MauiKit File Browsing utilities and controls"
HOMEPAGE="https://mauikit.org"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${KDE_ORG_CATEGORY}/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="LGPL-3"
SLOT="5"

DEPEND="
	>=dev-libs/mauikit-${PV}:5
	>=kde-frameworks/kio-${KFMIN}:5
"
RDEPEND="${DEPEND}"
