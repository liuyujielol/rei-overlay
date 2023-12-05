# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PLOCALES="ar_SA ay_BO be_BY bg_BG crowdin cs_CZ de_CH de_DE el_GR eo_UY es_AR es_BO es_ES fa_IR fi_FI fr_FR hi_IN ie_001 it_IT ja_JP jbo_EN ko_KR lt_LT mk_MK nl_NL pl_PL pt_BR pt_PT qt_extra_es qt_extra_it qt_extra_lt qtwebengine_zh_CN qu_PE ru_RU sk_SK sq_AL sr_SP sv_SE tg_TJ tk_TM tr_TR uk_UA vi_VN zh_CN zh_TW"

inherit cmake plocale xdg

DESCRIPTION="Next Generation GoldenDict"
HOMEPAGE="
	https://xiaoyifang.github.io/goldendict-ng/
	https://github.com/xiaoyifang/goldendict-ng/
"

MY_PV="${PV}-BeginningOfWinter.ff83be8a"
MY_P="${PN}-${MY_PV}"
SRC_URI="
	https://github.com/xiaoyifang/goldendict-ng/archive/refs/tags/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz
"
S="${WORKDIR}/${MY_P}"

LICENSE="
	GPL-3+
	!system-fmt? ( MIT )
	!system-toml? ( MIT )
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+epwing +ffmpeg +system-fmt +system-toml +tts +xapian +zim"

QTMIN="6.4"
RDEPEND="
	app-arch/bzip2
	app-arch/xz-utils
	app-i18n/opencc:=
	app-text/hunspell:=
	dev-libs/lzo:2
	>=dev-qt/qt5compat-${QTMIN}:6
	>=dev-qt/qtbase-${QTMIN}:6[concurrent,widgets,xml]
	>=dev-qt/qtmultimedia-${QTMIN}:6
	>=dev-qt/qtspeech-${QTMIN}:6
	>=dev-qt/qtsvg-${QTMIN}:6
	>=dev-qt/qttools-${QTMIN}:6[linguist]
	>=dev-qt/qtwebchannel-${QTMIN}:6
	>=dev-qt/qtwebengine-${QTMIN}:6[widgets]
	epwing? ( dev-libs/eb )
	ffmpeg? (
		media-video/ffmpeg:=
	)
	media-libs/libvorbis
	sys-libs/zlib
	virtual/libiconv
	virtual/opengl
	x11-libs/libX11
	x11-libs/libxkbcommon
	x11-libs/libXtst
	xapian? ( dev-libs/xapian:= )
	zim? ( dev-libs/libzim )
"
DEPEND="
	${RDEPEND}
	system-fmt? ( dev-libs/libfmt:= )
	system-toml? ( dev-libs/tomlplusplus )
"
BDEPEND="
	virtual/pkgconfig
"

src_prepare() {
	local loc_dir="${S}/locale"
	plocale_find_changes "${loc_dir}" "" ".ts"
	rm_loc() {
		rm -v "locale/${1}.ts" || die
	}
	plocale_for_each_disabled_locale rm_loc
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DWITH_EPWING_SUPPORT=$(usex epwing)
		-DWITH_FFMPEG_PLAYER=$(usex ffmpeg)
		-DWITH_TTS=$(usex tts)
		-DWITH_XAPIAN=$(usex xapian)
		-DWITH_ZIM=$(usex zim)
		-DUSE_SYSTEM_FMT=$(usex system-fmt)
		-DUSE_SYSTEM_TOML=$(usex system-toml)
		-DUSE_ALTERNATIVE_NAME=on # to match ${PN}
	)
	cmake_src_configure
}
