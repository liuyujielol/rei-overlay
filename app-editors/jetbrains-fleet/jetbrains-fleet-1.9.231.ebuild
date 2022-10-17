# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

DESCRIPTION="Next-generation IDE by JetBrains"
HOMEPAGE="https://www.jetbrains.com/fleet"
SRC_URI="https://download-cdn.jetbrains.com/fleet/installers/linux_x64/Fleet-${PV}.tar.gz"

LICENSE="JETBRAINS-EAP"
SLOT="0"
KEYWORDS="~amd64"

# by qa-vdb
DEPEND="
	dev-libs/glib:2
	media-libs/alsa-lib
	media-libs/fontconfig
	media-libs/freetype
	media-libs/libglvnd
	sys-libs/zlib
	x11-libs/libX11
	x11-libs/libXext
	x11-libs/libXi
	x11-libs/libXrender
	x11-libs/libXtst
"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="mirror strip bindist"

S="${WORKDIR}/Fleet"

QA_PRESTRIPED="*"
QA_PREBUILT="*"

src_install() {
	# !!maybe wrong to remove
	# non-x86 libs
	#rm backend/plugins/go/lib/dlv/linuxarm/dlv || die
	#rm backend/lib/pty4j-native/linux/arm/libpty.so || die
	#rm backend/lib/pty4j-native/linux/ppc64le/libpty.so || die
	#rm backend/lib/pty4j-native/linux/aarch64/libpty.so || die
	#rm backend/lib/pty4j-native/linux/mips64el/libpty.so || die

	# non GNU libs
	#rm backend/plugins/maven/lib/maven3/lib/jansi-native/freebsd32/libjansi.so || die
	#rm backend/plugins/maven/lib/maven3/lib/jansi-native/freebsd64/libjansi.so || die

	local bindir="/opt/${PN}"
	insinto "${bindir}"
	doins -r *

	doicon lib/Fleet.png
	domenu "${FILESDIR}/jetbrains-fleet.desktop"
	dosym -r "/opt/${PN}/bin/Fleet" "/usr/bin/jetbrains-fleet"

	for ex in $(find . -type f -executable -print)
	do
		#einfo "${ex/\./"${bindir}"}"
		fperms +x "${ex/\./"${bindir}"}"
	done
}
