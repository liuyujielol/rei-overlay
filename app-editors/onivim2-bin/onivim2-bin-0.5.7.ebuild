# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Native, lightweight modal code editor (third party binary)"
HOMEPAGE="https://github.com/santilococo/oni2"
SRC_URI="
	https://github.com/santilococo/oni2/releases/download/v${PV}/AppCache.tar -> ${P}-AppCache.tar
	https://github.com/santilococo/oni2/releases/download/v${PV}/AppDir.tar -> ${P}-AppDir.tar
"
RESTRICT="mirror strip bindist"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/glib:2
	sys-libs/ncurses
	media-libs/fontconfig
	media-libs/harfbuzz
	media-libs/libjpeg-turbo
	>=net-libs/nodejs-14.17.5-r1
	x11-libs/gtk+:3
	x11-libs/libXcursor
	x11-libs/libXi
	x11-libs/libXinerama
	x11-libs/libxkbfile
	x11-libs/libXrandr
	virtual/acl
	virtual/glu
"
RDEPEND="${DEPEND}"
BDEPEND=""

#QA_PRESTRIPPED="*"
#QA_FLAGS_IGNORED="*"
QA_PREBUILT="
	/opt/${PN}/usr/bin/Oni2
	/opt/${PN}/usr/bin/Oni2_editor
	/opt/${PN}/usr/bin/node
	/opt/${PN}/usr/bin/rg
	/opt/${PN}/usr/lib/libjpeg.a
	/opt/${PN}/usr/lib/libjpeg.so
	/opt/${PN}/usr/lib/libjpeg.so.62
	/opt/${PN}/usr/lib/libjpeg.so.62.3.0
	/opt/${PN}/usr/lib/libturbojpeg.a
	/opt/${PN}/usr/lib/libturbojpeg.so
	/opt/${PN}/usr/lib/libturbojpeg.so.0
	/opt/${PN}/usr/lib/libturbojpeg.so.0.2.0
"

S="${WORKDIR}"

src_prepare() {
	default
	mkdir "${WORKDIR}/${P}"
	cd "${WORKDIR}"/_release/Onivim2.AppDir || die "cd failed"
	cp -Lr {AppRun,usr} "${WORKDIR}/${P}"
	cd "${WORKDIR}"/AppCache || die "cd failed"
	cp -r camomile "${WORKDIR}/${P}"/usr/share
}

src_install() {
	insinto "/opt/${PN}"
	doins -r "${WORKDIR}/${P}"/*
	dosym "../../opt/${PN}/AppRun" "usr/bin/Oni2"
	domenu "${WORKDIR}"/_release/Onivim2.AppDir/Onivim2.desktop
	doicon "${WORKDIR}"/_release/Onivim2.AppDir/Onivim2.png
	fperms 755 "/opt/${PN}/AppRun"

	local f
	for f in "${QA_PREBUILT}"; do
		fperms 755 "${f}"
	done
}
