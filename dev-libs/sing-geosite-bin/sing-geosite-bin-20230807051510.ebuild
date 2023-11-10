# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="${PN//-bin/}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="sing-box geosite database"
HOMEPAGE="https://github.com/SagerNet/sing-geosite"
SRC_URI="https://github.com/SagerNet/sing-geosite/releases/download/${PV}/geosite.db -> ${MY_P}.db"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_unpack() {
	:
}

src_install() {
	insinto "/usr/share/${MY_PN}"
	newins "${DISTDIR}/${MY_P}.db" geosite.db
}
