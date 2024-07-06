# Copyright 2022-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PN="zhwiki-${PV}.dict.yaml"
MY_PV="0.2.4"

DESCRIPTION="Fcitx 5 Pinyin Dictionary from zh.wikipedia.org"
HOMEPAGE="https://github.com/felixonmars/fcitx5-pinyin-zhwiki"
SRC_URI="https://github.com/felixonmars/fcitx5-pinyin-zhwiki/releases/download/${MY_PV}/${MY_PN} -> ${P}.dict.yaml"
S="${DISTDIR}"

LICENSE="Unlicense"
SLOT="5"
KEYWORDS="~amd64"
RESTRICT="mirror"

RDEPEND="
	app-i18n/rime-data
"

src_install(){
	DICT_PATH="/usr/share/rime-data/"
	insinto ${DICT_PATH}
	doins ${P}.dict.yaml
	fperms 0644 "${DICT_PATH}/${P}.dict.yaml"
}
