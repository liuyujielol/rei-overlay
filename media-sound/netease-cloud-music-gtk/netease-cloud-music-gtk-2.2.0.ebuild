# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.10

EAPI=8

CRATES="
	adler@1.0.2
	aho-corasick@0.7.20
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anyhow@1.0.75
	async-channel@1.9.0
	atomic_refcell@0.1.12
	atty@0.2.14
	autocfg@1.1.0
	base64@0.21.4
	bitflags@1.3.2
	bitflags@2.4.0
	block@0.1.6
	bumpalo@3.14.0
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	cairo-rs@0.16.7
	cairo-sys-rs@0.16.3
	castaway@0.1.2
	cc@1.0.83
	cfg-expr@0.15.5
	cfg-if@1.0.0
	chrono@0.4.31
	color_quant@1.1.0
	concurrent-queue@2.3.0
	cookie@0.16.2
	cookie_store@0.19.1
	core-foundation-sys@0.8.4
	crc32fast@1.3.2
	crossbeam-utils@0.8.16
	curl-sys@0.4.66+curl-8.3.0
	curl@0.4.44
	dbus@0.6.5
	deranged@0.3.8
	encoding_rs@0.8.33
	env_logger@0.9.3
	equivalent@1.0.1
	event-listener@2.5.3
	fastrand@1.8.0
	fdeflate@0.3.0
	field-offset@0.3.6
	flate2@1.0.27
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-macro@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	gdk-pixbuf-sys@0.16.3
	gdk-pixbuf@0.16.7
	gdk4-sys@0.5.5
	gdk4@0.5.5
	getrandom@0.2.10
	gettext-rs@0.7.0
	gettext-sys@0.21.3
	gio-sys@0.16.3
	gio@0.16.7
	glib-macros@0.15.13
	glib-macros@0.16.8
	glib-sys@0.15.10
	glib-sys@0.16.3
	glib@0.15.12
	glib@0.16.9
	gobject-sys@0.15.10
	gobject-sys@0.16.3
	graphene-rs@0.16.3
	graphene-sys@0.16.3
	gsk4-sys@0.5.5
	gsk4@0.5.5
	gstreamer-base-sys@0.19.3
	gstreamer-base@0.19.3
	gstreamer-play-sys@0.19.2
	gstreamer-play@0.19.4
	gstreamer-sys@0.19.4
	gstreamer-video-sys@0.19.5
	gstreamer-video@0.19.5
	gstreamer@0.19.8
	gtk4-macros@0.5.6
	gtk4-sys@0.5.5
	gtk4@0.5.5
	hashbrown@0.14.1
	heck@0.4.1
	hermit-abi@0.1.19
	hex@0.4.3
	html-escape@0.2.13
	http@0.2.9
	httpdate@1.0.3
	humantime@2.1.0
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.57
	idna@0.3.0
	idna@0.4.0
	image@0.24.7
	indexmap@2.0.2
	instant@0.1.12
	isahc@1.7.2
	itoa@1.0.9
	js-sys@0.3.64
	lazy_static@1.4.0
	libadwaita-sys@0.2.1
	libadwaita@0.2.1
	libc@0.2.149
	libdbus-sys@0.2.5
	libnghttp2-sys@0.1.8+1.55.1
	libz-sys@1.1.12
	locale_config@0.3.0
	log@0.4.20
	malloc_buf@0.0.6
	memchr@2.6.4
	memoffset@0.9.0
	mime@0.3.17
	miniz_oxide@0.7.1
	mpris-player@0.6.2
	muldiv@1.0.1
	num-integer@0.1.45
	num-rational@0.4.1
	num-traits@0.2.17
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	once_cell@1.16.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.93
	openssl@0.10.57
	option-operations@0.5.0
	pango-sys@0.16.3
	pango@0.16.5
	parking@2.1.1
	paste@1.0.14
	percent-encoding@2.3.0
	pin-project-internal@1.1.3
	pin-project-lite@0.2.13
	pin-project@1.1.3
	pin-utils@0.1.0
	pkg-config@0.3.27
	png@0.17.10
	polling@2.8.0
	ppv-lite86@0.2.17
	pretty-hex@0.3.0
	proc-macro-crate@1.3.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.69
	psl-types@2.0.11
	publicsuffix@2.2.3
	qrcode-generator@4.1.9
	qrcodegen@1.8.0
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	regex-syntax@0.6.29
	regex@1.7.3
	rustc_version@0.4.0
	ryu@1.0.15
	schannel@0.1.22
	semver@1.0.19
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.107
	serde_spanned@0.6.3
	simd-adler32@0.3.7
	slab@0.4.9
	sluice@0.5.5
	smallvec@1.11.1
	socket2@0.4.9
	syn@1.0.109
	syn@2.0.38
	system-deps@6.1.2
	target-lexicon@0.12.11
	temp-dir@0.1.11
	termcolor@1.3.0
	thiserror-impl@1.0.49
	thiserror@1.0.49
	time-core@0.1.2
	time-macros@0.2.15
	time@0.3.29
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	toml@0.8.2
	toml_datetime@0.6.3
	toml_edit@0.19.15
	toml_edit@0.20.2
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	tracing-futures@0.2.5
	tracing@0.1.37
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	url@2.4.1
	urlqstring@0.3.5
	utf8-width@0.1.6
	vcpkg@0.2.15
	version-compare@0.1.1
	version_check@0.9.4
	waker-fn@1.1.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen@0.2.87
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows@0.48.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winnow@0.5.16
"

NCM_API_TAG='1.2.0'
NCM_API_COMMIT='3c4e3882baa258e5777981f6dcd7b54140ebba35'
declare -A GIT_CRATES=(
	[netease-cloud-music-api]="https://github.com/gmg137/netease-cloud-music-api;${NCM_API_COMMIT};netease-cloud-music-api-%commit%"
)

CARGO_OPTIONAL=1
inherit cargo gnome2-utils meson optfeature xdg

DESCRIPTION="netease cloud music player based on Rust & GTK for Linux"
HOMEPAGE="https://github.com/gmg137/netease-cloud-music-gtk"

if [[ ${PV} == *_p* ]]; then
	P_COMMIT="be9b997bc0a479543d160dd688de17062b1bd87b"
	SRC_URI="https://github.com/gmg137/netease-cloud-music-gtk/archive/${P_COMMIT}.tar.gz -> ${P}.tar.gz"
	S="${WORKDIR}/${PN}-${P_COMMIT}"
else
	SRC_URI="https://github.com/gmg137/netease-cloud-music-gtk/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
fi

SRC_URI+=" ${CARGO_CRATE_URIS} "

LICENSE="GPL-3"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD GPL-3+ MIT
	Unicode-DFS-2016
"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror"

DEPEND="
	dev-libs/glib:2
	dev-libs/openssl:*
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
	gui-libs/gtk:4
	gui-libs/libadwaita:1
	x11-libs/pango
"
RDEPEND="
	${DEPEND}
"
BDEPEND="virtual/rust"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	# cargo will try to update crates online despite
	# cargo_gen_config set [patch] table in cargo config
	# modify Cargo.toml with unpacked git crate (ncm-api)
	local ncm_api_git="git = \"https://github.com/gmg137/netease-cloud-music-api.git\", tag = \"${NCM_API_TAG}\""
	local ncm_api_path="path = \"${WORKDIR}/netease-cloud-music-api-${NCM_API_COMMIT}\""

	sed -i -E "s#${ncm_api_git}#${ncm_api_path}#g" "${S}/Cargo.toml" || die "ncm-api workaround failed"

	local PATCHES=(
		"${FILESDIR}/${PN}-2.0.3-fix-wrong-metainfo-install-location.patch"
	)
	default
}

src_configure() {
	local emesonargs=(
		-Dlocaledir=share/locale
		-Ddatadir=share
	)
	use debug || EMESON_BUILDTYPE=release
	meson_src_configure
}

pkg_postinst() {
	optfeature "osdlyrics integration" media-plugins/osdlyrics

	xdg_pkg_postinst
	gnome2_schemas_update
	gnome2_gdk_pixbuf_update
	gnome2_giomodule_cache_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
	gnome2_giomodule_cache_update
}