# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="The IDE for competitive programming"
HOMEPAGE="https://cpeditor.org"
SRC_URI="
	https://github.com/cpeditor/cpeditor/releases/download/${PV}/${PN}-${PV}-full-source.tar.gz
"

LICENSE="GPL-3 MIT LGPL-2.1 Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${P}-full-source"
