# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

if [[ "${PV}" == *9999* ]]; then
	PROPERTIES+=" live"
	# dev-dotnet/dotnet-sdk-bin:6.0 has no x86 keyword
	KEYWORDS="~amd64 ~arm ~arm64"
fi

MY_PV="2022.923.1"
SRC_URI="https://github.com/ppy/osu/archive/refs/tags/${MY_PV}.tar.gz -> ${PN}-${MY_PV}.tar.gz"

DESCRIPTION="Rhythm is just a click away!"
HOMEPAGE="https://osu.ppy.sh/"

LICENSE="MIT CC-BY-NC-4.0"
SLOT="0"
IUSE="elibc_musl"

# dev-dotnet/dotnet-sdk-bin:6.0 is both RDEPEND & BDEPEND
# as DOTNET_RUNTIME is contained in it.
DEPEND="
	dev-dotnet/dotnet-sdk-bin:6.0
	dev-dotnet/libgdiplus
	dev-util/desktop-file-utils
	media-libs/alsa-lib
	media-video/ffmpeg
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/dotnet-sdk:6.0
"

S="${WORKDIR}/osu-${MY_PV}"
DOTNET_RUNTIME="linux"

pkg_setup() {
	# linux-musl-x64 linux-musl-arm linux-musl-arm64
	use elibc_musl && DOTNET_RUNTIME+="-musl"

	if use amd64; then
		# linux-x64
		DOTNET_RUNTIME+="-x64"
	else
		# linux-arm linux-arm64
		DOTNET_RUNTIME+="-${ARCH}"
	fi
}

src_unpack() {
	unpack "${PN}-${MY_PV}.tar.gz"

	cd "${S}" || die
	dotnet restore osu.Desktop/osu.Desktop.csproj -r "${DOTNET_RUNTIME}" || die "dotnet restore failed"
}

src_compile() {
	dotnet publish osu.Desktop/osu.Desktop.csproj -c Release -r "${DOTNET_RUNTIME}" \
			-f net6.0 --no-restore --no-self-contained /property:Version="${MY_PV}" || die "dotnet publish failed"
}

src_install() {
	dobin "${FILESDIR}/osu-lazer"
	domenu "${FILESDIR}/osu-lazer.desktop"
	newicon assets/lazer.png osu-lazer.png

	insinto "/usr/share/mime/packages"
	doins "${FILESDIR}/x-osu-lazer.xml"

	#einfo "Removing PDB files..."
	find osu.Desktop/bin/Release/net6.0/"${DOTNET_RUNTIME}"/ -name "*.pdb" -delete -print

	cd osu.Desktop/bin/Release/net6.0/"${DOTNET_RUNTIME}"/ || die
	insinto "/usr/lib/${PN}"
	doins -r *

	for file_dll in $(find "${ED}/usr/lib/${PN}" -type f -name "*.dll")
	do
		if [ ! -d ${file_dll} ]; then
			fperms +x "${file_dll#"${ED}"}"
		fi
	done

	for file_so in $(find "${ED}/usr/lib/${PN}" -type f -name "*.so")
	do
		if [ ! -d ${file_so} ]; then
			fperms +x "${file_so#"${ED}"}"
		fi
	done

	fperms +x "/usr/lib/osu-lazer/osu!"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
	xdg_mimeinfo_database_update
}
