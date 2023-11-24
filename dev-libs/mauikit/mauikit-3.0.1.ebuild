# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_QTHELP="true"
KDE_ORG_CATEGORY="maui"
KFMIN=5.106.0
QTMIN=5.15.9
inherit ecm kde.org

DESCRIPTION="Templated convergent controls and multiplatform utilities for Maui applications"
HOMEPAGE="https://mauikit.org"

if [[ ${KDE_BUILD_TYPE} = release ]]; then
	SRC_URI="mirror://kde/stable/${KDE_ORG_CATEGORY}/${PN}/${PV}/${P}.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-3"
SLOT="5"

DEPEND="
	>=dev-libs/mauiman-${PV}:5
	>=dev-qt/qtdbus-${QTMIN}:5
	>=dev-qt/qtgui-${QTMIN}:5
	>=dev-qt/qtdeclarative-${QTMIN}:5
	>=dev-qt/qtnetwork-${QTMIN}:5
	>=dev-qt/qtquickcontrols2-${QTMIN}:5
	>=dev-qt/qtsql-${QTMIN}:5
	>=dev-qt/qtsvg-${QTMIN}:5
	>=dev-qt/qtwidgets-${QTMIN}:5
	>=dev-qt/qtxml-${QTMIN}:5
	>=kde-frameworks/attica-${KFMIN}:5
	>=kde-frameworks/kconfig-${KFMIN}:5
	>=kde-frameworks/kconfigwidgets-${KFMIN}:5
	>=kde-frameworks/ki18n-${KFMIN}:5
	>=kde-frameworks/kio-${KFMIN}:5
	>=kde-frameworks/knotifications-${KFMIN}:5
	>=kde-frameworks/kservice-${KFMIN}:5
	>=kde-frameworks/syntax-highlighting-${KFMIN}:5
"
RDEPEND="${DEPEND}
	>=dev-qt/qtgraphicaleffects-${QTMIN}:5
	>=dev-qt/qtmultimedia-${QTMIN}:5[qml]
	>=kde-frameworks/kirigami-${KFMIN}:5
"
