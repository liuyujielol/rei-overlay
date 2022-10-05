# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

if [[ "${PV}" == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/epasveer/seer.git"
else
	SRC_URI="https://github.com/epasveer/seer/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Seer - a gui frontend to gdb"
HOMEPAGE="https://github.com/epasveer/seer"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-qt/qtcore-5.15.2:5
	>=dev-qt/qtgui-5.15.2:5
	>=dev-qt/qtwidgets-5.15.2:5
	>=dev-qt/qtprintsupport-5.15.2:5
	>=dev-qt/qtcharts-5.15.2:5
"

S="${WORKDIR}/seer-${PV}/src"
