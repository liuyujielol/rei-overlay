# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop unpacker xdg

DESCRIPTION="Document Viewer for CAJ, KDH, NH, TEB and PDF format"

HOMEPAGE="http://cajviewer.cnki.net"
SRC_URI="https://download.cnki.net/cajviewer_${PV}-1_amd64.deb"

RESTRICT="mirror strip"

LICENSE="CAJVIEWER-EULA"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	sys-apps/dbus
	x11-misc/shared-mime-info
"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

QA_PREBUILT="
	/opt/apps/cajviewer/lib/*.so*
	/opt/apps/cajviewer/plugins/*/*.so
"

src_install() {
	insinto /opt
	doins -r ./opt/apps

	domenu usr/share/applications/cajviewer.desktop
	for size in 16 22 24 32 48 64 128; do
		doicon -s ${size} -c mimetypes usr/share/icons/hicolor/${size}x${size}/mimetypes/application-{caj,kdh,nh,teb}.png
	done

	insinto /usr/share/mime/packages
	doins usr/share/mime/packages/cnki-caj.xml

	fperms +x /opt/apps/cajviewer/CAJViewer
	fperms +x /opt/apps/cajviewer/start.sh
}
