# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit ecm

if [[ ${PV} = *9999* ]] ; then
	EGIT_REPO_URI="https://github.com/orblazer/plasma-applet-resources-monitor.git"
	inherit git-r3
else
	SRC_URI="https://github.com/orblazer/plasma-applet-resources-monitor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Plasma 5 applet for monitoring CPU, RAM and network traffic."
HOMEPAGE="https://www.pling.com/p/1527636/"

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	kde-plasma/libksysguard:5
	dev-qt/qtgraphicaleffects:5
"
RDEPEND="${DEPEND}"
BDEPEND=""
