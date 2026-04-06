# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="My Custom World"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+devel +dist-kernel +fcitx +fonts +games +gentoo-zh +intel +kde +misc +multimedia +portage"

RDEPEND="
	www-client/firefox
	devel? (
		app-editors/lapce
		app-editors/zed
		app-emulation/virt-manager
		dev-debug/gdb
		llvm-core/lldb
		dev-qt/qt-docs
		dev-qt/qt-creator
		dev-util/astyle
		dev-util/clazy
		dev-util/cppcheck
		dev-util/uncrustify
		sys-apps/ripgrep
	)
	dist-kernel? (
		sys-boot/os-prober
		sys-kernel/gentoo-kernel-bin
		sys-kernel/linux-firmware
	)
	fcitx? (
		app-i18n/fcitx-configtool[kcm]
		app-i18n/fcitx-gtk
		app-i18n/fcitx-qt
		app-i18n/fcitx-rime
	)
	fonts? (
		media-fonts/ibm-plex
		media-fonts/ms-windows
		media-fonts/nerd-fonts[ibmplexmono,-nerdfontssymbolsonly]
	)
	games? (
		app-emulation/dxvk
		app-emulation/vkd3d-proton
		app-emulation/wine-proton
		games-action/prismlauncher
		games-action/vintagestory
	)
	gentoo-zh? (
		net-proxy/v2rayA
		net-proxy/Xray
	)
	intel? (
		dev-libs/intel-compute-runtime
		media-libs/libva-intel-media-driver
		media-libs/vpl-gpu-rt
	)
	kde? (
		app-misc/wayland-utils
		app-text/aha
		dev-util/clinfo
		dev-util/vulkan-tools[cube]
		kde-apps/kdeutils-meta
		kde-plasma/plasma-meta
		media-libs/vulkan-layers
		sys-auth/rtkit
		x11-apps/mesa-progs
		x11-apps/xdpyinfo
		x11-themes/papirus-icon-theme
	)
	misc? (
		app-admin/doas
		app-editors/nano
		app-editors/vim
		app-shells/bash-completion
		app-shells/gentoo-zsh-completions
		app-shells/zsh
		app-shells/zsh-completions
		net-im/telegram-desktop[-webkit]
		net-p2p/qbittorrent-enhanced
		sys-apps/zram-generator
		sys-fs/dosfstools
		sys-fs/exfatprogs
		sys-fs/ntfs3g
		sys-fs/xfsprogs
	)
	multimedia? (
		media-gfx/graphviz
		media-gfx/gimp
		media-gfx/icoutils
		media-gfx/inkscape
		media-gfx/krita
		media-gfx/nomacs
		media-sound/strawberry
		media-video/haruna
	)
	portage? (
		app-admin/eclean-kernel
		app-eselect/eselect-repository
		app-portage/eix
		app-portage/euses
		app-portage/flaggie
		app-portage/gentoolkit
		app-portage/pycargoebuild
		app-text/ansifilter[-gui]
		dev-dotnet/gentoo-dotnet-maintainer-tools
		dev-util/pkgdev
	)
"
