# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	adler32-1.2.0
	ahash-0.7.6
	aho-corasick-0.6.10
	aho-corasick-0.7.19
	alloc-no-stdlib-2.0.4
	alloc-stdlib-0.2.2
	android_system_properties-0.1.5
	anyhow-1.0.66
	arc-swap-1.5.1
	async-channel-1.7.1
	async-executor-1.5.0
	async-fs-1.6.0
	async-io-1.10.0
	async-lock-2.6.0
	async-net-1.7.0
	async-process-1.5.0
	async-task-4.3.0
	async-trait-0.1.58
	atk-0.15.1
	atk-sys-0.15.1
	atomic-waker-1.0.0
	attohttpc-0.22.0
	auto-launch-0.4.0
	autocfg-1.1.0
	backtrace-0.3.66
	base64-0.13.1
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.9.0
	block-buffer-0.10.3
	blocking-1.2.0
	brotli-3.3.4
	brotli-decompressor-2.3.2
	bstr-0.2.17
	buf_redux-0.8.4
	bumpalo-3.11.1
	bytemuck-1.12.3
	byteorder-1.4.3
	bytes-1.2.1
	cache-padded-1.2.0
	cairo-rs-0.15.12
	cairo-sys-rs-0.15.1
	cargo_toml-0.13.0
	cc-1.0.76
	cesu8-1.1.0
	cfb-0.6.1
	cfg-expr-0.9.1
	cfg-expr-0.11.0
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.23
	cocoa-0.24.1
	cocoa-foundation-0.1.0
	codespan-reporting-0.11.1
	color_quant-1.1.0
	combine-4.6.6
	concat-idents-1.1.4
	concurrent-queue-1.2.4
	concurrent-queue-2.0.0
	convert_case-0.4.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	cpufeatures-0.2.5
	crc32fast-1.3.2
	cron_clock-0.8.0
	crossbeam-channel-0.5.6
	crossbeam-deque-0.8.2
	crossbeam-epoch-0.9.11
	crossbeam-utils-0.8.12
	crypto-common-0.1.6
	cssparser-0.27.2
	cssparser-macros-0.6.0
	ctor-0.1.26
	ctrlc-3.2.3
	cty-0.2.2
	cxx-1.0.81
	cxx-build-1.0.81
	cxxbridge-flags-1.0.81
	cxxbridge-macro-1.0.81
	darling-0.13.4
	darling_core-0.13.4
	darling_macro-0.13.4
	dashmap-4.0.2
	deelevate-0.2.0
	deflate-0.7.20
	delay_timer-0.11.3
	derivative-2.2.0
	derive_more-0.99.17
	destructure_traitobject-0.2.0
	digest-0.9.0
	digest-0.10.6
	dirs-2.0.2
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dispatch-0.2.0
	dtoa-0.4.8
	dtoa-short-0.3.3
	dunce-1.0.3
	either-1.8.0
	embed_plist-1.2.2
	encoding_rs-0.8.31
	event-listener-2.5.3
	failure-0.1.8
	fastrand-1.8.0
	field-offset-0.3.4
	filedescriptor-0.8.2
	filetime-0.2.18
	flate2-1.0.24
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	futf-0.1.5
	futures-0.3.25
	futures-channel-0.3.25
	futures-core-0.3.25
	futures-executor-0.3.25
	futures-io-0.3.25
	futures-lite-1.12.0
	futures-macro-0.3.25
	futures-sink-0.3.25
	futures-task-0.3.25
	futures-util-0.3.25
	fxhash-0.2.1
	gdk-0.15.4
	gdk-pixbuf-0.15.11
	gdk-pixbuf-sys-0.15.10
	gdk-sys-0.15.1
	gdkx11-sys-0.15.1
	generator-0.7.1
	generic-array-0.14.6
	getrandom-0.1.16
	getrandom-0.2.8
	gimli-0.26.2
	gio-0.15.12
	gio-sys-0.15.10
	glib-0.15.12
	glib-macros-0.15.11
	glib-sys-0.15.10
	glob-0.3.0
	globset-0.4.9
	gobject-sys-0.15.10
	gtk-0.15.5
	gtk-sys-0.15.3
	gtk3-macros-0.15.4
	h2-0.3.15
	handlebars-0.29.1
	hashbrown-0.12.3
	headers-0.3.8
	headers-core-0.2.0
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	html5ever-0.25.2
	http-0.2.8
	http-body-0.4.5
	http-range-0.1.5
	httparse-1.8.0
	httpdate-1.0.2
	humantime-2.1.0
	hyper-0.14.23
	hyper-tls-0.5.0
	iana-time-zone-0.1.53
	iana-time-zone-haiku-0.1.1
	ico-0.1.0
	ident_case-1.0.1
	idna-0.3.0
	ignore-0.4.18
	image-0.24.5
	indexmap-1.9.1
	infer-0.7.0
	inflate-0.3.4
	instant-0.1.12
	interfaces-0.0.8
	ipnet-2.5.1
	itoa-0.4.8
	itoa-1.0.4
	javascriptcore-rs-0.16.0
	javascriptcore-rs-sys-0.4.0
	jni-0.20.0
	jni-sys-0.3.0
	js-sys-0.3.60
	json-patch-0.2.6
	kuchiki-0.8.1
	lazy_static-0.2.11
	lazy_static-1.4.0
	libappindicator-0.7.1
	libappindicator-sys-0.7.3
	libc-0.2.137
	libloading-0.7.4
	line-wrap-0.1.1
	link-cplusplus-1.0.7
	linked-hash-map-0.5.6
	lock_api-0.4.9
	log-0.3.9
	log-0.4.17
	log-mdc-0.1.0
	log4rs-1.2.0
	loom-0.5.6
	lru-0.7.8
	mac-0.1.1
	malloc_buf-0.0.6
	markup5ever-0.10.1
	matchers-0.1.0
	matches-0.1.9
	memchr-2.5.0
	memmem-0.1.1
	memoffset-0.6.5
	mime-0.3.16
	mime_guess-2.0.4
	minimal-lexical-0.2.1
	minisign-verify-0.2.1
	miniz_oxide-0.5.4
	miniz_oxide-0.6.2
	mio-0.8.5
	multipart-0.18.0
	nanoid-0.4.0
	native-tls-0.2.11
	ndk-0.6.0
	ndk-context-0.1.1
	ndk-sys-0.3.0
	new_debug_unreachable-1.0.4
	nix-0.23.1
	nix-0.25.0
	nodrop-0.1.14
	nom-5.1.2
	nom-7.1.1
	ntapi-0.4.0
	nu-ansi-term-0.46.0
	num-derive-0.3.3
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.14.0
	num_enum-0.5.7
	num_enum_derive-0.5.7
	objc-0.2.7
	objc-foundation-0.1.1
	objc_exception-0.1.2
	objc_id-0.1.1
	object-0.29.0
	once_cell-1.16.0
	opaque-debug-0.3.0
	open-3.0.3
	openssl-0.10.42
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-sys-0.9.77
	ordered-float-2.10.0
	os_pipe-1.1.1
	overload-0.1.1
	pango-0.15.10
	pango-sys-0.15.10
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.4
	paste-1.0.9
	pathdiff-0.2.1
	pathsearch-0.2.0
	percent-encoding-2.2.0
	pest-0.3.3
	pest-2.4.1
	phf-0.8.0
	phf-0.10.1
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_generator-0.10.0
	phf_macros-0.8.0
	phf_macros-0.10.0
	phf_shared-0.8.0
	phf_shared-0.10.0
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.26
	plist-1.3.1
	png-0.11.0
	png-0.17.7
	polling-2.4.0
	port_scanner-0.1.5
	ppv-lite86-0.2.17
	precomputed-hash-0.1.1
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.47
	quick-error-1.2.3
	quote-1.0.21
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.4
	rand_hc-0.2.0
	rand_pcg-0.2.1
	raw-window-handle-0.5.0
	rayon-1.5.3
	rayon-core-1.9.3
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-0.2.11
	regex-1.7.0
	regex-automata-0.1.10
	regex-syntax-0.5.6
	regex-syntax-0.6.28
	remove_dir_all-0.5.3
	reqwest-0.11.13
	rfd-0.10.0
	rquickjs-0.1.7
	rquickjs-core-0.1.7
	rquickjs-sys-0.1.7
	rs-snowflake-0.6.0
	runas-0.2.1
	rustc-demangle-0.1.21
	rustc_version-0.2.3
	rustc_version-0.3.3
	rustc_version-0.4.0
	rustls-pemfile-0.2.1
	rustversion-1.0.9
	ryu-1.0.11
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.20
	scoped-tls-1.0.1
	scopeguard-1.1.0
	scratch-1.0.2
	security-framework-2.7.0
	security-framework-sys-2.6.1
	selectors-0.22.0
	semver-0.9.0
	semver-0.11.0
	semver-1.0.14
	semver-parser-0.7.0
	semver-parser-0.10.2
	serde-1.0.147
	serde-value-0.7.0
	serde_derive-1.0.147
	serde_json-1.0.87
	serde_repr-0.1.9
	serde_urlencoded-0.7.1
	serde_with-1.14.0
	serde_with_macros-1.5.2
	serde_yaml-0.8.26
	serde_yaml-0.9.14
	serialize-to-javascript-0.1.1
	serialize-to-javascript-impl-0.1.1
	servo_arc-0.1.1
	sha-1-0.10.0
	sha1-0.10.5
	sha2-0.9.9
	sha2-0.10.6
	sharded-slab-0.1.4
	shared_child-1.0.0
	shared_library-0.1.9
	signal-hook-0.1.17
	signal-hook-0.3.14
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	slab-0.4.7
	smallvec-1.10.0
	smol-1.2.5
	socket2-0.4.7
	soup2-0.2.1
	soup2-sys-0.2.0
	stable_deref_trait-1.2.0
	state-0.5.3
	string_cache-0.8.4
	string_cache_codegen-0.5.2
	strsim-0.10.0
	syn-1.0.103
	sysinfo-0.26.7
	sysproxy-0.1.0
	system-deps-5.0.0
	system-deps-6.0.3
	tao-0.15.4
	tar-0.4.38
	tauri-1.2.0
	tauri-build-1.2.0
	tauri-codegen-1.2.0
	tauri-macros-1.2.0
	tauri-runtime-0.12.0
	tauri-runtime-wry-0.12.0
	tauri-utils-1.2.0
	tempfile-3.3.0
	tendril-0.4.3
	termcolor-1.1.3
	terminfo-0.7.3
	termios-0.3.3
	termwiz-0.15.0
	thin-slice-0.1.1
	thiserror-1.0.37
	thiserror-impl-1.0.37
	thread-id-4.0.0
	thread_local-0.3.6
	thread_local-1.1.4
	time-0.1.44
	time-0.3.17
	time-core-0.1.0
	time-macros-0.2.6
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.21.2
	tokio-macros-1.8.0
	tokio-native-tls-0.3.0
	tokio-stream-0.1.11
	tokio-tungstenite-0.17.2
	tokio-util-0.7.4
	toml-0.5.9
	tower-service-0.3.2
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	tracing-log-0.1.3
	tracing-subscriber-0.3.16
	treediff-3.0.2
	try-lock-0.2.3
	tungstenite-0.17.3
	twoway-0.1.8
	typemap-ors-1.0.0
	typenum-1.15.0
	ucd-trie-0.1.5
	ucd-util-0.1.9
	unicase-2.6.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.5
	unicode-normalization-0.1.22
	unicode-segmentation-1.10.0
	unicode-width-0.1.10
	unsafe-any-ors-1.0.0
	unsafe-libyaml-0.2.4
	url-2.3.1
	utf-8-0.7.6
	utf8-ranges-1.0.5
	utf8parse-0.2.0
	uuid-0.8.2
	uuid-1.2.2
	valuable-0.1.0
	vcpkg-0.2.15
	version-compare-0.0.11
	version-compare-0.1.1
	version_check-0.9.4
	vtparse-0.6.2
	waker-fn-1.1.0
	walkdir-2.3.2
	want-0.3.0
	warp-0.3.3
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-futures-0.4.33
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	web-sys-0.3.60
	webkit2gtk-0.18.2
	webkit2gtk-sys-0.18.0
	webview2-com-0.19.1
	webview2-com-macros-0.6.0
	webview2-com-sys-0.19.0
	wepoll-ffi-0.1.2
	which-3.1.1
	which-4.3.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	window-shadows-0.2.0
	window-vibrancy-0.3.1
	windows-0.32.0
	windows-0.37.0
	windows-0.39.0
	windows-bindgen-0.39.0
	windows-implement-0.39.0
	windows-metadata-0.39.0
	windows-sys-0.36.1
	windows-sys-0.42.0
	windows-tokens-0.39.0
	windows_aarch64_gnullvm-0.42.0
	windows_aarch64_msvc-0.32.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.37.0
	windows_aarch64_msvc-0.39.0
	windows_aarch64_msvc-0.42.0
	windows_i686_gnu-0.32.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.37.0
	windows_i686_gnu-0.39.0
	windows_i686_gnu-0.42.0
	windows_i686_msvc-0.32.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.37.0
	windows_i686_msvc-0.39.0
	windows_i686_msvc-0.42.0
	windows_x86_64_gnu-0.32.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.37.0
	windows_x86_64_gnu-0.39.0
	windows_x86_64_gnu-0.42.0
	windows_x86_64_gnullvm-0.42.0
	windows_x86_64_msvc-0.32.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.37.0
	windows_x86_64_msvc-0.39.0
	windows_x86_64_msvc-0.42.0
	winreg-0.10.1
	winres-0.1.12
	wry-0.22.1
	x11-2.20.0
	x11-dl-2.20.0
	xattr-0.2.3
	xml-rs-0.8.4
	yaml-rust-0.4.5
	zip-0.6.3
"

inherit cargo desktop xdg

DESCRIPTION="A Clash GUI based on tauri"
HOMEPAGE="https://github.com/zzzgydi/clash-verge"

MMDB_V="20221112"

SRC_URI="
	https://github.com/zzzgydi/clash-verge/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Dreamacro/maxmind-geoip/releases/download/${MMDB_V}/Country.mmdb -> clash-country-${MMDB_V}.mmdb
	https://github.com/liuyujielol/vendors/releases/download/clash-verge/${P}-yarn_mirror.tar.gz
	$(cargo_crate_uris ${CRATES})
"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
IUSE=""
RESTRICT="test" # cargo-tauri-test

DEPEND="
	dev-libs/glib:2
	dev-libs/openssl:=
	dev-libs/libappindicator
	net-libs/webkit-gtk:4=
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	net-proxy/clash
	net-proxy/clash-meta
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-util/cargo-tauri-1.0.4
	dev-lang/typescript
	dev-lang/quickjs
	sys-apps/yarn
"

# disable Appimage & .deb creation
# remove requirement of bundled clash & clash-meta binaries
PATCHES=(
	"${FILESDIR}/${P}-remove-bundle-creation-and-tauri-updater.patch"
)

src_unpack() {
	unpack "${P}.tar.gz"
	unpack "${P}-yarn_mirror.tar.gz"

	# modified cargo_src_unpack begin
	mkdir -p "${ECARGO_VENDOR}" || die

	local archive shasum pkg
	for archive in ${A}; do
		case "${archive}" in
			*.crate)
				ebegin "Loading ${archive} into Cargo registry"
				tar -xf "${DISTDIR}"/${archive} -C "${ECARGO_VENDOR}/" || die
				# generate sha256sum of the crate itself as cargo needs this
				shasum=$(sha256sum "${DISTDIR}"/${archive} | cut -d ' ' -f 1)
				pkg=$(basename ${archive} .crate)
				cat <<- EOF > ${ECARGO_VENDOR}/${pkg}/.cargo-checksum.json
				{
					"package": "${shasum}",
					"files": {}
				}
				EOF
				eend $?
				;;
			*)
				;;
		esac
	done

	cargo_gen_config
	# modified cargo_src_unpack end

}

src_compile() {

	mkdir src-tauri/resources || die
	mkdir src-tauri/sidecar || die
	ln -sv "${ROOT}"/usr/bin/clash "src-tauri/sidecar/clash-x86_64-unknown-linux-gnu"
	ln -sv "${ROOT}"/usr/bin/clash-meta "src-tauri/sidecar/clash-meta-x86_64-unknown-linux-gnu"
	ln -sv "${DISTDIR}/clash-country-${MMDB_V}.mmdb" src-tauri/resources/Country.mmdb

	echo "yarn-offline-mirror \"${WORKDIR}/yarn_offline_mirror\"" > "${S}/.yarnrc" || die
	echo "yarn-offline-mirror-pruning true" >> "${S}/.yarnrc" || die
	yarn install --offline --frozen-lockfile --checkfiles || die

	export RUSTFLAGS="${RUSTFLAGS} -L /usr/lib/quickjs"
	cargo-tauri build -- $(usex debug "" --release) || die "cargo tauri build failed"
}

src_install() {
	dobin src-tauri/target/release/clash-verge

	insinto "/usr/lib/${PN}/resources"
	doins src-tauri/target/release/resources/Country.mmdb

	newicon -s 32 src-tauri/icons/32x32.png clash-verge.png
	newicon -s 128 src-tauri/icons/128x128.png clash-verge.png
	newicon -s 256 src-tauri/icons/128x128@2x.png clash-verge.png
	domenu "${FILESDIR}/clash-verge.desktop"
}
