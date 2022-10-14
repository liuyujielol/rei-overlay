# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

# sed -re 's/^(\S*) (\S*) (\S*)/"\1 \2"/g' go.sum
# echo "goproxy https://goproxy.cn/" >> /etc/portage/mirrors
EGO_SUM=(
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/toml v1.1.0"
	"github.com/BurntSushi/toml v1.1.0/go.mod"
	"github.com/coreos/go-systemd/v22 v22.3.2/go.mod"
	"github.com/cristalhq/aconfig v0.16.1/go.mod"
	"github.com/cristalhq/aconfig v0.17.0"
	"github.com/cristalhq/aconfig v0.17.0/go.mod"
	"github.com/cristalhq/aconfig/aconfighcl v0.16.1"
	"github.com/cristalhq/aconfig/aconfighcl v0.16.1/go.mod"
	"github.com/cristalhq/aconfig/aconfigtoml v0.16.1"
	"github.com/cristalhq/aconfig/aconfigtoml v0.16.1/go.mod"
	"github.com/cristalhq/aconfig/aconfigyaml v0.17.0"
	"github.com/cristalhq/aconfig/aconfigyaml v0.17.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/godbus/dbus/v5 v5.0.4/go.mod"
	"github.com/hashicorp/hcl v1.0.0"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/krolaw/dhcp4 v0.0.0-20190909130307-a50d88189771"
	"github.com/krolaw/dhcp4 v0.0.0-20190909130307-a50d88189771/go.mod"
	"github.com/libp2p/go-reuseport v0.2.0"
	"github.com/libp2p/go-reuseport v0.2.0/go.mod"
	"github.com/miekg/dns v1.1.49"
	"github.com/miekg/dns v1.1.49/go.mod"
	"github.com/oschwald/geoip2-golang v1.7.0"
	"github.com/oschwald/geoip2-golang v1.7.0/go.mod"
	"github.com/oschwald/maxminddb-golang v1.9.0"
	"github.com/oschwald/maxminddb-golang v1.9.0/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/rs/xid v1.3.0/go.mod"
	"github.com/rs/zerolog v1.26.1"
	"github.com/rs/zerolog v1.26.1/go.mod"
	"github.com/sower-proxy/conns v0.0.3"
	"github.com/sower-proxy/conns v0.0.3/go.mod"
	"github.com/sower-proxy/deferlog v1.0.4"
	"github.com/sower-proxy/deferlog v1.0.4/go.mod"
	"github.com/sower-proxy/mem v0.0.3"
	"github.com/sower-proxy/mem v0.0.3/go.mod"
	"github.com/stretchr/testify v1.7.1"
	"github.com/yuin/goldmark v1.3.5/go.mod"
	"github.com/yuin/goldmark v1.4.0/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/crypto v0.0.0-20211215165025-cf75a172585e/go.mod"
	"golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e"
	"golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e/go.mod"
	"golang.org/x/mod v0.4.2/go.mod"
	"golang.org/x/mod v0.6.0-dev.0.20220106191415-9b9b3d81d5e3"
	"golang.org/x/mod v0.6.0-dev.0.20220106191415-9b9b3d81d5e3/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20210226172049-e18ecbb05110/go.mod"
	"golang.org/x/net v0.0.0-20210405180319-a5a99cb37ef4/go.mod"
	"golang.org/x/net v0.0.0-20210726213435-c6fcb2dbf985/go.mod"
	"golang.org/x/net v0.0.0-20210805182204-aaa1db679c0d/go.mod"
	"golang.org/x/net v0.0.0-20220531201128-c960675eff93"
	"golang.org/x/net v0.0.0-20220531201128-c960675eff93/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c"
	"golang.org/x/sync v0.0.0-20210220032951-036812b2e83c/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20201119102817-f84b799fce68/go.mod"
	"golang.org/x/sys v0.0.0-20210330210617-4fbd30eecc44/go.mod"
	"golang.org/x/sys v0.0.0-20210423082822-04245dca01da/go.mod"
	"golang.org/x/sys v0.0.0-20210510120138-977fb7262007/go.mod"
	"golang.org/x/sys v0.0.0-20210630005230-0f9fa26af87c/go.mod"
	"golang.org/x/sys v0.0.0-20210809222454-d867a43fc93e/go.mod"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a"
	"golang.org/x/sys v0.0.0-20220520151302-bc2c85ada10a/go.mod"
	"golang.org/x/term v0.0.0-20201126162022-7de9c90e9dd1/go.mod"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.3/go.mod"
	"golang.org/x/text v0.3.6/go.mod"
	"golang.org/x/text v0.3.7"
	"golang.org/x/text v0.3.7/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.1.6-0.20210726203631-07bc1bf47fb2/go.mod"
	"golang.org/x/tools v0.1.7/go.mod"
	"golang.org/x/tools v0.1.10"
	"golang.org/x/tools v0.1.10/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20200804184101-5ec99f83aff1/go.mod"
	"golang.org/x/xerrors v0.0.0-20220517211312-f3a8303e98df"
	"golang.org/x/xerrors v0.0.0-20220517211312-f3a8303e98df/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
)
go-module_set_globals

DESCRIPTION="Sower is a cross-platform intelligent transparent proxy solution"
HOMEPAGE="https://github.com/sower-proxy/sower"
SRC_URI="
	https://github.com/sower-proxy/sower/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="server"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	ego build -ldflags "\
		-X main.version=${PV} \
		-X main.date=$(date +%Y-%m-%d)" \
		-o sower ./cmd/sower

	use server && ego build -ldflags "\
		-X main.version=${PV} \
		-X main.date=$(date +%Y-%m-%d)" \
		-o sowerd ./cmd/sowerd
}

src_install() {
	dobin sower
	use server && dobin sowerd
	dodoc README.md

	systemd_dounit "${FILESDIR}/sower.service"
	use server && systemd_dounit "${FILESDIR}/sowerd.service"

	insinto "/etc/sower"
	doins "${FILESDIR}/sower.hcl"
	doins "${FILESDIR}/sower.yaml"
}

pkg_postins() {
	if use server; then
		einfo ""
		einfo "when using sowerd service"
		einfo "run systemdctl edit to add ENV"
		einfo "Environment=\"FAKE_SITE=\$HOST:\$PORT\""
		einfo "Environment=\"PASSWORD=\$PWD\""
		einfo ""
	fi
}
