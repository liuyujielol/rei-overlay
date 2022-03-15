# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV=${PV//_p/-}

DESCRIPTION="A container-based approach to boot a full Android system on a regular Linux system (Android image)"
HOMEPAGE="https://waydro.id/"
SRC_URI="
	amd64? (
	https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86_64/lineage-${MY_PV}-VANILLA-waydroid_x86_64-system.zip
	https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86_64/lineage-${MY_PV}-MAINLINE-waydroid_x86_64-vendor.zip
	)
	arm? (
	https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm/lineage-${MY_PV}-VANILLA-waydroid_arm-system.zip
	https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm/lineage-${MY_PV}-MAINLINE-waydroid_arm-vendor.zip
	)
	arm64? (
	https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_arm64/lineage-${MY_PV}-VANILLA-waydroid_arm64-system.zip
	https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_arm64/lineage-${MY_PV}-MAINLINE-waydroid_arm64-vendor.zip
	)
	x86? (
	https://sourceforge.net/projects/waydroid/files/images/system/lineage/waydroid_x86/lineage-${MY_PV}-VANILLA-waydroid_x86-system.zip
	https://sourceforge.net/projects/waydroid/files/images/vendor/waydroid_x86/lineage-${MY_PV}-MAINLINE-waydroid_x86-vendor.zip
	)
"

LICENSE="Apache-1.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

DEPEND="
	!app-emulation/waydroid-image-gapps
"
RDEPEND="
	${DEPEND}
"
BDEPEND="
	app-arch/unzip
"

RESTRICT=" mirror "

S="${WORKDIR}"

src_install() {
	insinto "/usr/share/waydroid-extra/images/"
	doins system.img
	doins vendor.img
}
