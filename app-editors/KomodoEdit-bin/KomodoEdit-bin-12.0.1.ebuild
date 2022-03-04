# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#PYTHON_COMPAT=( python2_7 )

#inherit python-any-r1 desktop xdg
inherit desktop xdg

MY_PN="Komodo-Edit"
SUB_PV="18441"

DESCRIPTION="a fast and free multi-language code editor"
HOMEPAGE="http://www.komodoide.com/komodo-edit"
SRC_URI="
	https://downloads.activestate.com/Komodo/releases/${PV}/${MY_PN}-${PV}-${SUB_PV}-linux-x86_64.tar.gz
"

RESTRICT=" mirror test"

LICENSE="MPL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_PN}-${PV}-${SUB_PV}-linux-x86_64"

src_install() {
	./install.sh -v -s -I "${ED}/opt/${PN}" --dest-dir "/opt/${PN}" >/dev/null 2>&1
	find "${ED}/opt/${PN}" -iname '*.py?' -delete
	sed -i "s#${ED}##" "${ED}/opt/${PN}/share/desktop/komodo-edit-12.desktop"
	newmenu "${ED}/opt/${PN}/share/desktop/komodo-edit-12.desktop" "${MY_PN}.desktop"
	dosym "../../opt/${PN}/bin/komodo" "/usr/bin/komodo"
	die
}
