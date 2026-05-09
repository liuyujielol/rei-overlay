# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="My Custom World"

SLOT="0"
KEYWORDS="~amd64"
IUSE="+devel +dist-kernel +fcitx +fonts +games +intel +kde +misc +multimedia +portage"

RDEPEND="
	www-client/firefox
	devel? (
		app-editors/vim
		dev-debug/gdb
		llvm-core/lldb
		dev-util/astyle
		dev-util/clazy
		dev-util/cppcheck
		dev-util/uncrustify
		sys-apps/ripgrep
	)
	dist-kernel? (
		sys-boot/grub
		sys-boot/os-prober
		sys-kernel/gentoo-kernel-bin
		sys-kernel/installkernel
		sys-kernel/linux-firmware
		sys-kernel/scx-loader
	)
	fcitx? (
		app-i18n/fcitx-configtool
		app-i18n/fcitx-gtk
		app-i18n/fcitx-qt
		app-i18n/fcitx-rime
	)
	fonts? (
		media-fonts/ibm-plex
		media-fonts/ms-windows
		media-fonts/noto-cjk
	)
	games? (
		games-action/prismlauncher
		games-action/vintagestory
		gnome-extra/zenity
	)
	net-proxy/daed
	intel? (
		dev-libs/intel-compute-runtime
		media-libs/libva-intel-media-driver
		media-libs/vpl-gpu-rt
	)
	kde? (
		app-arch/7zip
		app-arch/rar
		app-crypt/keysmith
		app-misc/wayland-utils
		app-text/aha
		dev-util/clinfo
		dev-util/vulkan-tools
		kde-apps/kdeadmin-meta
		kde-apps/kdecore-meta
		kde-apps/ark
		kde-apps/filelight
		kde-apps/kate
		kde-apps/kcalc
		kde-apps/kcharselect
		kde-apps/kgpg
		kde-apps/kwalletmanager
		kde-apps/sweeper
		kde-apps/yakuake
		kde-misc/kclock
		kde-misc/markdownpart
		kde-plasma/plasma-meta
		media-libs/vulkan-layers
		media-video/libva-utils
		net-misc/networkmanager
		sys-auth/rtkit
		x11-apps/mesa-progs
		x11-apps/xdpyinfo
		x11-themes/papirus-icon-theme
	)
	misc? (
		app-admin/sudo-rs
		app-editors/nano
		app-shells/bash-completion
		app-shells/gentoo-zsh-completions
		app-shells/zsh
		app-shells/zsh-completions
		app-misc/fastfetch
		net-misc/aria2
		net-im/telegram-desktop-bin
		sys-apps/zram-generator
		sys-fs/btrfs-progs
		sys-fs/dosfstools
		sys-fs/exfatprogs
		sys-fs/ntfs3g
		sys-fs/xfsprogs
		sys-process/btop
		sys-process/htop
		sys-process/lsof
		sys-process/nvtop
	)
	multimedia? (
		media-gfx/nomacs
		media-sound/strawberry
		media-video/haruna
	)
	portage? (
		app-admin/eclean-kernel
		app-eselect/eselect-repository
		app-portage/eix
		app-portage/euses
		app-portage/gentoolkit
		app-portage/pycargoebuild
		app-text/ansifilter
		dev-build/steve
		dev-dotnet/gentoo-dotnet-maintainer-tools
		dev-util/ccache
		dev-util/pkgdev
	)
"
