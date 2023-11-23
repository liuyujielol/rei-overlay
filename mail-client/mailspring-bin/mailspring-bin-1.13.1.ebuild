# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit unpacker xdg

DESCRIPTION="beautiful, fast and fully open source mail client"
HOMEPAGE="
	https://getmailspring.com
	https://github.com/Foundry376/Mailspring
"
SRC_URI="https://github.com/Foundry376/Mailspring/releases/download/${PV}/mailspring-${PV}-amd64.deb"
S="${WORKDIR}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* ~amd64"
RESTRICT="mirror"
IUSE="libnotify"

RDEPEND="app-crypt/libsecret
	dev-libs/libgcrypt
	dev-libs/nss
	gnome-base/gnome-keyring
	sys-libs/db
	virtual/libudev
	x11-libs/gtk+:2
	x11-libs/libXtst
	x11-misc/xdg-utils
	libnotify? ( x11-libs/libnotify )
	|| (
		dev-libs/glib:2
		gnome-base/gvfs
	)"

QA_PRESTRIPPED="
usr/share/mailspring/resources/app.asar.unpacked/libanonymous.so
usr/share/mailspring/resources/app.asar.unpacked/libanonymous.so.2
usr/share/mailspring/resources/app.asar.unpacked/libanonymous.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libcrammd5.so
usr/share/mailspring/resources/app.asar.unpacked/libcrammd5.so.2
usr/share/mailspring/resources/app.asar.unpacked/libcrammd5.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libdigestmd5.so
usr/share/mailspring/resources/app.asar.unpacked/libdigestmd5.so.2
usr/share/mailspring/resources/app.asar.unpacked/libdigestmd5.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libgs2.so
usr/share/mailspring/resources/app.asar.unpacked/libgs2.so.2
usr/share/mailspring/resources/app.asar.unpacked/libgs2.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libgssapiv2.so
usr/share/mailspring/resources/app.asar.unpacked/libgssapiv2.so.2
usr/share/mailspring/resources/app.asar.unpacked/libgssapiv2.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/liblogin.so
usr/share/mailspring/resources/app.asar.unpacked/liblogin.so.2
usr/share/mailspring/resources/app.asar.unpacked/liblogin.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libntlm.so
usr/share/mailspring/resources/app.asar.unpacked/libntlm.so.2
usr/share/mailspring/resources/app.asar.unpacked/libntlm.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libplain.so
usr/share/mailspring/resources/app.asar.unpacked/libplain.so.2
usr/share/mailspring/resources/app.asar.unpacked/libplain.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libsasl2.so.2
usr/share/mailspring/resources/app.asar.unpacked/libsasldb.so
usr/share/mailspring/resources/app.asar.unpacked/libsasldb.so.2
usr/share/mailspring/resources/app.asar.unpacked/libsasldb.so.2.0.25
usr/share/mailspring/resources/app.asar.unpacked/libscram.so
usr/share/mailspring/resources/app.asar.unpacked/libscram.so.2
usr/share/mailspring/resources/app.asar.unpacked/libscram.so.2.0.25
"
QA_PREBUILT="
usr/share/mailspring/mailspring
usr/share/mailspring/libGLESv2.so
usr/share/mailspring/libvulkan.so.1
usr/share/mailspring/libvk_swiftshader.so
usr/share/mailspring/libffmpeg.so
usr/share/mailspring/chrome_crashpad_handler
usr/share/mailspring/libEGL.so
usr/share/mailspring/chrome-sandbox
${QA_PRESTRIPPED}
"

src_prepare() {
	default

	mv "usr/share/appdata" "usr/share/metainfo" || die "mv failed"
}

src_install() {
	#insinto "/usr/share"
	#doins -r usr/share/{metainfo,applications,icons,lintian,mailspring,pixmaps}
	#fperms +x /usr/share/mailspring/chrome-sandbox
	#fperms +x /usr/share/mailspring/mailspring

	cp -a . "${ED}" || die
	rm -r "${ED}/usr/share/doc/mailspring" || die

	dosym -r /usr/share/mailspring/mailspring /usr/bin/mailspring
}
