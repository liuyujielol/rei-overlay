# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.18
	ansi_term-0.12.1
	anyhow-1.0.55
	async-channel-1.6.1
	async-executor-1.4.1
	async-global-executor-2.0.2
	async-io-1.6.0
	async-lock-2.5.0
	async-mutex-1.4.0
	async-std-1.10.0
	async-task-4.1.0
	atk-0.9.0
	atk-sys-0.10.0
	atomic-waker-1.0.0
	atty-0.2.14
	autocfg-1.1.0
	base64-0.13.0
	bincode-1.3.3
	bitflags-1.3.2
	blocking-1.1.0
	bumpalo-3.9.1
	bytes-1.1.0
	cache-padded-1.2.0
	cairo-rs-0.9.1
	cairo-sys-rs-0.10.0
	castaway-0.1.2
	cc-1.0.73
	cfg-if-1.0.0
	chrono-0.4.19
	concurrent-queue-1.2.2
	crossbeam-utils-0.8.7
	ctor-0.1.21
	curl-0.4.42
	curl-sys-0.4.52+curl-7.81.0
	custom_error-1.9.2
	dbus-0.6.5
	dirs-4.0.0
	dirs-sys-0.3.6
	either-1.6.1
	encoding_rs-0.8.30
	event-listener-2.5.2
	fastrand-1.7.0
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	fragile-1.1.0
	futures-0.3.21
	futures-channel-0.3.21
	futures-core-0.3.21
	futures-executor-0.3.21
	futures-io-0.3.21
	futures-lite-1.12.0
	futures-macro-0.3.21
	futures-sink-0.3.21
	futures-task-0.3.21
	futures-util-0.3.21
	gdk-0.13.2
	gdk-pixbuf-0.9.0
	gdk-pixbuf-sys-0.10.0
	gdk-sys-0.10.0
	getrandom-0.2.5
	gio-0.9.1
	gio-sys-0.10.1
	glib-0.10.3
	glib-macros-0.10.1
	glib-sys-0.10.1
	gloo-timers-0.2.3
	gobject-sys-0.10.0
	gstreamer-0.16.7
	gstreamer-base-0.16.5
	gstreamer-base-sys-0.9.1
	gstreamer-player-0.16.5
	gstreamer-player-sys-0.9.1
	gstreamer-sys-0.9.1
	gstreamer-video-0.16.7
	gstreamer-video-sys-0.9.1
	gtk-0.9.2
	gtk-sys-0.10.0
	heck-0.3.3
	hermit-abi-0.1.19
	hex-0.4.3
	http-0.2.6
	httpdate-1.0.2
	idna-0.2.3
	instant-0.1.12
	isahc-1.6.0
	itertools-0.9.0
	itoa-1.0.1
	js-sys-0.3.56
	kv-log-macro-1.0.7
	lazy_static-1.4.0
	libc-0.2.119
	libdbus-sys-0.2.2
	libnghttp2-sys-0.1.7+1.45.0
	libz-sys-1.1.3
	log-0.4.14
	loggerv-0.7.2
	matches-0.1.9
	memchr-2.4.1
	mime-0.3.16
	mp4ameta-0.9.1
	mp4ameta_proc-0.4.0
	mpris-player-0.6.1
	muldiv-0.2.1
	num-0.4.0
	num-bigint-0.4.3
	num-complex-0.4.0
	num-integer-0.1.44
	num-iter-0.1.42
	num-rational-0.3.2
	num-rational-0.4.0
	num-traits-0.2.14
	num_cpus-1.13.1
	once_cell-1.9.0
	openssl-0.10.38
	openssl-probe-0.1.5
	openssl-sys-0.9.72
	pango-0.9.1
	pango-sys-0.10.0
	parking-2.0.0
	paste-1.0.6
	percent-encoding-2.1.0
	pin-project-1.0.10
	pin-project-internal-1.0.10
	pin-project-lite-0.2.8
	pin-utils-0.1.0
	pkg-config-0.3.24
	polling-2.2.0
	ppv-lite86-0.2.16
	pretty-hex-0.2.1
	proc-macro-crate-0.1.5
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.36
	quote-1.0.15
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.3
	redox_syscall-0.2.10
	redox_users-0.4.0
	regex-1.5.4
	regex-syntax-0.6.25
	ryu-1.0.9
	schannel-0.1.19
	serde-1.0.136
	serde_derive-1.0.136
	serde_json-1.0.79
	slab-0.4.5
	sluice-0.5.5
	socket2-0.4.4
	strum-0.18.0
	strum_macros-0.18.0
	syn-1.0.86
	system-deps-1.3.2
	thiserror-1.0.30
	thiserror-impl-1.0.30
	time-0.1.43
	tinyvec-1.5.1
	tinyvec_macros-0.1.0
	toml-0.5.8
	tracing-0.1.31
	tracing-attributes-0.1.19
	tracing-core-0.1.22
	tracing-futures-0.2.5
	unicode-bidi-0.3.7
	unicode-normalization-0.1.19
	unicode-segmentation-1.9.0
	unicode-xid-0.2.2
	url-2.2.2
	urlqstring-0.3.5
	value-bag-1.0.0-alpha.8
	vcpkg-0.2.15
	version-compare-0.0.10
	version_check-0.9.4
	waker-fn-1.1.0
	wasi-0.10.2+wasi-snapshot-preview1
	wasm-bindgen-0.2.79
	wasm-bindgen-backend-0.2.79
	wasm-bindgen-futures-0.4.29
	wasm-bindgen-macro-0.2.79
	wasm-bindgen-macro-support-0.2.79
	wasm-bindgen-shared-0.2.79
	web-sys-0.3.56
	wepoll-ffi-0.1.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-x86_64-pc-windows-gnu-0.4.0
	xdg-2.4.1
"

inherit cargo desktop xdg

DESCRIPTION="netease cloud music player based on Rust & GTK for Linux"
HOMEPAGE="https://github.com/gmg137/netease-cloud-music-gtk"
SRC_URI="
	https://github.com/gmg137/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris ${CRATES})
"
RESTRICT="mirror"

LICENSE="GPL-3+ Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD Boost-1.0 GPL-3 MIT Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+lyrics"

DEPEND="
	dev-libs/glib:2
	dev-libs/openssl:=
	media-libs/gst-plugins-bad:1.0
	media-libs/gst-plugins-base:1.0
	media-libs/gst-plugins-good
	media-libs/gst-plugins-ugly
	media-libs/gstreamer:1.0
	media-plugins/gst-plugins-libav
	media-plugins/gst-plugins-soup
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango
"
RDEPEND="
	${DEPEND}
	lyrics? (
		media-plugins/osdlyrics
	)
"

src_configure() {
		local myfeatures=(
			gtk_3_24
		)
		cargo_src_configure --no-default-features
}

src_compile() {
	cargo_src_compile
	die
}

src_install() {
	dobin target/release/netease-cloud-music-gtk
	domenu netease-cloud-music-gtk.desktop
	doicon -s scalable icons/netease-cloud-music-gtk.svg
}
