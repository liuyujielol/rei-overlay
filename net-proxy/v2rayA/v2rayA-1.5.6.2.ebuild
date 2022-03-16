# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit systemd go-module desktop xdg

DESCRIPTION="web GUI of Project V which supports V2Ray, Xray, SS, SSR, Trojan and Pingtunnel"
HOMEPAGE="https://v2raya.org/"

SRC_URI="
	https://github.com/v2rayA/v2rayA/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"
# 3rd-party generated vendor
# generated with https://github.com/liuyujielol/rei-overlay/blob/main/net-proxy/v2rayA/scripts/v2rayA_vendor_gen.sh
SRC_URI+="
	https://github.com/liuyujielol/rei-overlay/releases/download/vendor/v2rayA-${PV}-yarn_mirror.tar.gz
	https://github.com/liuyujielol/rei-overlay/releases/download/vendor/v2rayA-${PV}-go-deps.tar.xz
"
LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+v2ray xray systemd"
REQUIRED_USE="|| ( v2ray xray )"

DEPEND=""
RDEPEND="${DEPEND}
	v2ray? ( || (
		net-proxy/v2ray
		net-proxy/v2ray-bin
	) )
	xray? ( >=net-proxy/Xray-1.4.3 )
"
BDEPEND="
	dev-lang/go
	>=net-libs/nodejs-14.17.5-r1
	sys-apps/yarn
"

YARN_WORKDIR="${S}/gui"

src_unpack() {
	# ${P}.tar.gz => ${S}
	# v2rayA-${PV}-yarn_mirror.tar.gz => ${WORKDIR}/yarn_offline_mirror
	# v2rayA-${PV}-go-deps.tar.xz => ${WORKDIR}/go-mod
	default

	# set yarn-offline-mirror to ${WORKDIR}/yarn_offline_mirror
	cd "${YARN_WORKDIR}" || die
	echo "yarn-offline-mirror \"${WORKDIR}/yarn_offline_mirror\"" >> "${YARN_WORKDIR}/.yarnrc" || die
	yarn install --offline || die

	# GOMODCACHE has already been set to ${WORKDIR}/go-mod by go-module.eclass
}

src_compile() {
	cd "${YARN_WORKDIR}" || die
	OUTPUT_DIR="${S}/service/server/router/web" yarn build || die

	for file in $(find "${S}/service/server/router/web" |grep -v png |grep -v index.html|grep -v .gz)
	do
		if [ ! -d $file ]; then
			gzip -9 $file
		fi
	done

	cd "${S}/service" || die
	CGO_ENABLED=0 go build -ldflags "-X github.com/v2rayA/v2rayA/conf.Version='${PV}' -s -w" -o v2raya || die
}

src_install() {
	default
	dobin "${S}"/service/v2raya

	if use systemd; then
		systemd_newunit "${S}"/install/universal/v2raya.service v2raya.service
		systemd_newunit "${S}"/install/universal/v2raya@.service v2raya@.service
	fi

	newicon -s 512 "${S}"/gui/public/img/icons/android-chrome-512x512.png v2raya.png
	domenu "${S}"/install/universal/v2raya.desktop
}
