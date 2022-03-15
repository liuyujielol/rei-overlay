# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..10} )

inherit linux-info python-r1 systemd desktop xdg

DESCRIPTION="A container-based approach to boot a full Android system on a regular Linux system"
HOMEPAGE="https://waydro.id https://github.com/waydroid/waydroid"
SRC_URI="
	https://github.com/waydroid/waydroid/archive/refs/tags/1.2.0.tar.gz -> ${P}.tar.gz
"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

MINKV="5.7"

DEPEND="
	${PYTHON_DEPS}
	|| (
		app-emulation/waydroid-image
		app-emulation/waydroid-image-gapps
	)
"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_pretend(){
	local CONFIG_CHECK="
		~CONFIG_ASHMEM ~CONFIG_ANDROID
		~CONFIG_ANDROID_BINDER_IPC ~CONFIG_ANDROID_BINDERFS
		~CONFIG_ANDROID_BINDER_DEVICES
	"

	if linux_config_exists; then
		local config_android_binder_devices=$(linux_chkconfig_string CONFIG_ANDROID_BINDER_DEVICES)
		if [[ -n ${config_android_binder_devices} ]] && [[ ${config_android_binder_devices} != '""' ]]; then
			ewarn "It's recommended to set an empty value to the following kernel config option:"
			ewarn "CONFIG_ANDROID_BINDER_DEVICES=${config_android_binder_devices}"
		fi
	fi

	if kernel_is -lt ${MINKV//./ }; then
		ewarn "Kernel version at least ${MINKV} required"
	fi

	check_extra_config
}

src_install() {
	insinto "/usr/lib/${PN}"
	doins -r tools data waydroid.py

	dosym "usr/lib/${PN}/waydroid.py" "usr/bin/waydroid"

	insinto "/etc"
	doins "${FILESDIR}/gbinder.conf"
	insinto "/etc/gbinder.d"
	doins "${S}/gbinder/anbox.conf"

	domenu "${S}/data/Waydroid.desktop"
	if use systemd; then
		systemd_dounit "${S}/debian/waydroid-container.service"
	fi
}
