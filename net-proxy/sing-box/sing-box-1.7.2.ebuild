# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit bash-completion-r1 go-module systemd

DESCRIPTION="The universal proxy platform"
HOMEPAGE="
	https://sing-box.sagernet.org
	https://github.com/SagerNet/sing-box
"
SRC_URI="
	https://github.com/SagerNet/sing-box/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"
SRC_URI+="
	https://github.com/liuyujielol/gentoo-go-deps/releases/download/${P}/${P}-deps.tar.xz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror test"

RDEPEND="
	dev-libs/sing-geoip-bin
	dev-libs/sing-geosite-bin
"
BDEPEND="
	>=dev-lang/go-1.20:*
"

src_compile() {
	local ETAGS='with_gvisor,with_dhcp,with_wireguard,with_utls,with_reality_server,with_clash_api,with_quic,with_ech'
	ego build -o ./bin/sing-box\
		-v -trimpath -ldflags "-X 'github.com/sagernet/sing-box/constant.Version=${PV}' -s -w -buildid="\
		-tags "${ETAGS}"\
		./cmd/sing-box

	ego run ./cmd/sing-box completion bash > "${PN}.bash"
	ego run ./cmd/sing-box completion fish > "${PN}.fish"
	ego run ./cmd/sing-box completion zsh > "${PN}.zsh"
}

src_install() {
	dobin ./bin/sing-box

	insinto "/etc/${PN}"
	doins release/config/config.json

	systemd_dounit release/config/sing-box.service
	systemd_dounit release/config/sing-box@.service

	newbashcomp "${PN}.bash" "${PN}"

	insinto "/usr/share/fish/vendor_completions.d/"
	doins "${PN}.fish"

	insinto "/usr/share/zsh/site-functions/"
	newins "${PN}.zsh" "_${PN}"
}
