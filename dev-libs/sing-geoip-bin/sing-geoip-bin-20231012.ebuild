# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN//-bin/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="sing-box geoip database"
HOMEPAGE="
	https://github.com/SagerNet/sing-geoip
"
SRC_URI="
	https://github.com/SagerNet/sing-geoip/releases/download/${PV}/geoip-cn.db -> ${MY_PN}-cn-${PV}.db
	https://github.com/SagerNet/sing-geoip/releases/download/${PV}/geoip.db -> ${MY_P}.db
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_unpack() {
	:
}

src_install() {
	insinto "/usr/share/${MY_PN}"
	newins "${DISTDIR}/${MY_PN}-cn-${PV}.db" geoip-cn.db
	newins "${DISTDIR}/${MY_P}.db" geoip.db
}
