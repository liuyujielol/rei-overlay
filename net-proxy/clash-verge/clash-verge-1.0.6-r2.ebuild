# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line-0.17.0
	adler-1.0.2
	adler32-1.2.0
	ahash-0.7.6
	aho-corasick-0.7.18
	alloc-no-stdlib-2.0.3
	alloc-stdlib-0.2.1
	ansi_term-0.12.1
	anyhow-1.0.58
	arc-swap-1.5.0
	async-channel-1.6.1
	async-executor-1.4.1
	async-fs-1.5.0
	async-io-1.7.0
	async-lock-2.5.0
	async-net-1.6.1
	async-process-1.4.0
	async-task-4.3.0
	async-trait-0.1.56
	atk-0.15.1
	atk-sys-0.15.1
	atomic-waker-1.0.0
	attohttpc-0.19.1
	auto-launch-0.3.0
	autocfg-1.1.0
	backtrace-0.3.66
	base64-0.13.0
	bitflags-1.3.2
	block-0.1.6
	block-buffer-0.9.0
	block-buffer-0.10.2
	blocking-1.2.0
	brotli-3.3.4
	brotli-decompressor-2.3.2
	bstr-0.2.17
	buf_redux-0.8.4
	bumpalo-3.10.0
	bytemuck-1.10.0
	byteorder-1.4.3
	bytes-1.1.0
	cache-padded-1.2.0
	cairo-rs-0.15.12
	cairo-sys-rs-0.15.1
	cargo_toml-0.11.5
	cc-1.0.73
	cesu8-1.1.0
	cfb-0.6.1
	cfg-expr-0.9.1
	cfg-expr-0.10.3
	cfg-if-0.1.10
	cfg-if-1.0.0
	chrono-0.4.19
	cocoa-0.24.0
	cocoa-foundation-0.1.0
	color_quant-1.1.0
	combine-4.6.4
	concat-idents-1.1.3
	concurrent-queue-1.2.2
	convert_case-0.4.0
	core-foundation-0.9.3
	core-foundation-sys-0.8.3
	core-graphics-0.22.3
	core-graphics-types-0.1.1
	cpufeatures-0.2.2
	crc32fast-1.3.2
	cron_clock-0.8.0
	crossbeam-channel-0.5.5
	crossbeam-utils-0.8.10
	crypto-common-0.1.6
	cssparser-0.27.2
	cssparser-macros-0.6.0
	ctor-0.1.22
	cty-0.2.2
	darling-0.13.4
	darling_core-0.13.4
	darling_macro-0.13.4
	dashmap-4.0.2
	deelevate-0.2.0
	deflate-0.7.20
	deflate-1.0.0
	delay_timer-0.11.3
	derivative-2.2.0
	derive_more-0.99.17
	digest-0.9.0
	digest-0.10.3
	dirs-2.0.2
	dirs-4.0.0
	dirs-next-2.0.0
	dirs-sys-0.3.7
	dirs-sys-next-0.1.2
	dispatch-0.2.0
	dtoa-0.4.8
	dtoa-short-0.3.3
	dunce-1.0.2
	either-1.7.0
	embed-resource-1.7.2
	embed_plist-1.2.2
	encoding_rs-0.8.31
	event-listener-2.5.2
	failure-0.1.8
	fastrand-1.7.0
	field-offset-0.3.4
	filedescriptor-0.8.2
	filetime-0.2.17
	flate2-1.0.24
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.0.1
	futf-0.1.5
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
	fxhash-0.2.1
	gdk-0.15.4
	gdk-pixbuf-0.15.11
	gdk-pixbuf-sys-0.15.10
	gdk-sys-0.15.1
	gdkx11-sys-0.15.1
	generator-0.7.0
	generic-array-0.14.5
	getrandom-0.1.16
	getrandom-0.2.7
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
	h2-0.3.13
	hashbrown-0.11.2
	hashbrown-0.12.2
	headers-0.3.7
	headers-core-0.2.0
	heck-0.3.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	html5ever-0.25.2
	http-0.2.8
	http-body-0.4.5
	http-range-0.1.5
	httparse-1.7.1
	httpdate-1.0.2
	humantime-2.1.0
	hyper-0.14.20
	hyper-tls-0.5.0
	ico-0.1.0
	ident_case-1.0.1
	idna-0.2.3
	ignore-0.4.18
	image-0.24.2
	indexmap-1.9.1
	infer-0.7.0
	inflate-0.3.4
	instant-0.1.12
	ipnet-2.5.0
	itoa-0.4.8
	itoa-1.0.2
	javascriptcore-rs-0.16.0
	javascriptcore-rs-sys-0.4.0
	jni-0.18.0
	jni-0.19.0
	jni-sys-0.3.0
	js-sys-0.3.58
	json-patch-0.2.6
	kuchiki-0.8.1
	lazy_static-1.4.0
	libappindicator-0.7.1
	libappindicator-sys-0.7.3
	libc-0.2.126
	libloading-0.7.3
	line-wrap-0.1.1
	linked-hash-map-0.5.6
	lock_api-0.4.7
	log-0.4.17
	log-mdc-0.1.0
	log4rs-1.1.1
	loom-0.5.6
	lru-0.7.7
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
	miniz_oxide-0.5.3
	mio-0.8.4
	multipart-0.18.0
	nanoid-0.4.0
	native-tls-0.2.10
	ndk-0.6.0
	ndk-context-0.1.1
	ndk-sys-0.3.0
	new_debug_unreachable-1.0.4
	nodrop-0.1.14
	nom-5.1.2
	nom-7.1.1
	num-derive-0.3.3
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.4.1
	num-traits-0.2.15
	num_cpus-1.13.1
	num_enum-0.5.7
	num_enum_derive-0.5.7
	num_threads-0.1.6
	objc-0.2.7
	objc-foundation-0.1.1
	objc_exception-0.1.2
	objc_id-0.1.1
	object-0.29.0
	once_cell-1.13.0
	opaque-debug-0.3.0
	open-2.1.3
	open-3.0.1
	openssl-0.10.41
	openssl-macros-0.1.0
	openssl-probe-0.1.5
	openssl-sys-0.9.75
	ordered-float-2.10.0
	os_pipe-1.0.1
	pango-0.15.10
	pango-sys-0.15.10
	parking-2.0.0
	parking_lot-0.11.2
	parking_lot-0.12.1
	parking_lot_core-0.8.5
	parking_lot_core-0.9.3
	paste-1.0.7
	pathdiff-0.2.1
	pathsearch-0.2.0
	percent-encoding-2.1.0
	pest-2.1.3
	phf-0.8.0
	phf-0.10.1
	phf_codegen-0.8.0
	phf_generator-0.8.0
	phf_generator-0.10.0
	phf_macros-0.8.0
	phf_macros-0.10.0
	phf_shared-0.8.0
	phf_shared-0.10.0
	pin-project-1.0.11
	pin-project-internal-1.0.11
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pkg-config-0.3.25
	plist-1.3.1
	png-0.11.0
	png-0.17.5
	polling-2.2.0
	port_scanner-0.1.5
	ppv-lite86-0.2.16
	precomputed-hash-0.1.1
	proc-macro-crate-1.1.3
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.19
	proc-macro2-1.0.40
	quick-error-1.2.3
	quote-1.0.20
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.3
	rand_hc-0.2.0
	rand_pcg-0.2.1
	raw-window-handle-0.4.3
	redox_syscall-0.2.13
	redox_users-0.4.3
	regex-1.6.0
	regex-automata-0.1.10
	regex-syntax-0.6.27
	remove_dir_all-0.5.3
	reqwest-0.11.11
	rfd-0.9.1
	rquickjs-0.1.6
	rquickjs-core-0.1.6
	rquickjs-sys-0.1.6
	rs-snowflake-0.6.0
	runas-0.2.1
	rustc-demangle-0.1.21
	rustc_version-0.2.3
	rustc_version-0.3.3
	rustc_version-0.4.0
	rustversion-1.0.8
	ryu-1.0.10
	safemem-0.3.3
	same-file-1.0.6
	schannel-0.1.20
	scoped-tls-1.0.0
	scopeguard-1.1.0
	security-framework-2.6.1
	security-framework-sys-2.6.1
	selectors-0.22.0
	semver-0.9.0
	semver-0.11.0
	semver-1.0.12
	semver-parser-0.7.0
	semver-parser-0.10.2
	serde-1.0.139
	serde-value-0.7.0
	serde_derive-1.0.139
	serde_json-1.0.82
	serde_repr-0.1.8
	serde_urlencoded-0.7.1
	serde_with-1.14.0
	serde_with_macros-1.5.2
	serde_yaml-0.8.26
	serialize-to-javascript-0.1.1
	serialize-to-javascript-impl-0.1.1
	servo_arc-0.1.1
	sha-1-0.9.8
	sha-1-0.10.0
	sha2-0.9.9
	sha2-0.10.2
	sharded-slab-0.1.4
	shared_child-1.0.0
	shared_library-0.1.9
	signal-hook-0.1.17
	signal-hook-0.3.14
	signal-hook-registry-1.4.0
	siphasher-0.3.10
	slab-0.4.6
	smallvec-1.9.0
	smol-1.2.5
	socket2-0.4.4
	soup2-0.2.1
	soup2-sys-0.2.0
	stable_deref_trait-1.2.0
	state-0.5.3
	string_cache-0.8.4
	string_cache_codegen-0.5.2
	strsim-0.10.0
	syn-1.0.98
	system-deps-5.0.0
	system-deps-6.0.2
	tao-0.12.1
	tar-0.4.38
	tauri-1.0.4
	tauri-build-1.0.4
	tauri-codegen-1.0.4
	tauri-macros-1.0.4
	tauri-runtime-0.10.2
	tauri-runtime-wry-0.10.2
	tauri-utils-1.0.3
	tempfile-3.3.0
	tendril-0.4.3
	terminfo-0.7.3
	termios-0.3.3
	termwiz-0.15.0
	thin-slice-0.1.1
	thiserror-1.0.31
	thiserror-impl-1.0.31
	thread-id-4.0.0
	thread_local-1.1.4
	time-0.1.44
	time-0.3.11
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	tokio-1.20.0
	tokio-macros-1.8.0
	tokio-native-tls-0.3.0
	tokio-stream-0.1.9
	tokio-tungstenite-0.15.0
	tokio-util-0.6.10
	tokio-util-0.7.3
	toml-0.5.9
	tower-service-0.3.2
	tracing-0.1.35
	tracing-attributes-0.1.22
	tracing-core-0.1.28
	tracing-log-0.1.3
	tracing-subscriber-0.3.14
	traitobject-0.1.0
	treediff-3.0.2
	try-lock-0.2.3
	tungstenite-0.14.0
	twoway-0.1.8
	typemap-0.3.3
	typenum-1.15.0
	ucd-trie-0.1.4
	unicase-2.6.0
	unicode-bidi-0.3.8
	unicode-ident-1.0.2
	unicode-normalization-0.1.21
	unicode-segmentation-1.9.0
	unsafe-any-0.4.2
	url-2.2.2
	utf-8-0.7.6
	utf8parse-0.2.0
	uuid-0.8.2
	uuid-1.1.2
	valuable-0.1.0
	vcpkg-0.2.15
	version-compare-0.0.11
	version-compare-0.1.0
	version_check-0.9.4
	vswhom-0.1.0
	vswhom-sys-0.1.1
	vtparse-0.6.1
	waker-fn-1.1.0
	walkdir-2.3.2
	want-0.3.0
	warp-0.3.2
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.81
	wasm-bindgen-backend-0.2.81
	wasm-bindgen-futures-0.4.31
	wasm-bindgen-macro-0.2.81
	wasm-bindgen-macro-support-0.2.81
	wasm-bindgen-shared-0.2.81
	web-sys-0.3.58
	webkit2gtk-0.18.0
	webkit2gtk-sys-0.18.0
	webview2-com-0.16.0
	webview2-com-macros-0.6.0
	webview2-com-sys-0.16.0
	wepoll-ffi-0.1.2
	which-3.1.1
	which-4.2.5
	wildmatch-2.1.1
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	window-shadows-0.1.3
	window-vibrancy-0.1.3
	windows-0.37.0
	windows-bindgen-0.37.0
	windows-implement-0.37.0
	windows-metadata-0.37.0
	windows-sys-0.36.1
	windows-tokens-0.37.0
	windows_aarch64_msvc-0.36.1
	windows_aarch64_msvc-0.37.0
	windows_i686_gnu-0.36.1
	windows_i686_gnu-0.37.0
	windows_i686_msvc-0.36.1
	windows_i686_msvc-0.37.0
	windows_x86_64_gnu-0.36.1
	windows_x86_64_gnu-0.37.0
	windows_x86_64_msvc-0.36.1
	windows_x86_64_msvc-0.37.0
	winreg-0.10.1
	winres-0.1.12
	wry-0.19.0
	x11-2.19.1
	x11-dl-2.19.1
	xattr-0.2.3
	xml-rs-0.8.4
	yaml-rust-0.4.5
	zip-0.6.2
"

EYARN_LOCK=(
	"@actions/github/-/github-5.0.3.tgz"
	"@actions/http-client/-/http-client-2.0.1.tgz"
	"adm-zip/-/adm-zip-0.5.9.tgz"
	"agent-base/-/agent-base-6.0.2.tgz"
	"ahooks/-/ahooks-3.7.0.tgz"
	"ahooks-v3-count/-/ahooks-v3-count-1.0.0.tgz"
	"@ampproject/remapping/-/remapping-2.1.2.tgz"
	"ansi-styles/-/ansi-styles-3.2.1.tgz"
	"ansi-styles/-/ansi-styles-4.3.0.tgz"
	"anymatch/-/anymatch-3.1.2.tgz"
	"array-differ/-/array-differ-3.0.0.tgz"
	"array-union/-/array-union-2.1.0.tgz"
	"arrify/-/arrify-2.0.1.tgz"
	"asynckit/-/asynckit-0.4.0.tgz"
	"axios/-/axios-0.27.2.tgz"
	"@babel/code-frame/-/code-frame-7.16.7.tgz"
	"@babel/code-frame/-/code-frame-7.18.6.tgz"
	"@babel/compat-data/-/compat-data-7.18.13.tgz"
	"@babel/core/-/core-7.18.13.tgz"
	"@babel/generator/-/generator-7.18.13.tgz"
	"@babel/helper-annotate-as-pure/-/helper-annotate-as-pure-7.18.6.tgz"
	"@babel/helper-compilation-targets/-/helper-compilation-targets-7.18.9.tgz"
	"@babel/helper-environment-visitor/-/helper-environment-visitor-7.18.9.tgz"
	"@babel/helper-function-name/-/helper-function-name-7.18.9.tgz"
	"@babel/helper-hoist-variables/-/helper-hoist-variables-7.18.6.tgz"
	"@babel/helper-module-imports/-/helper-module-imports-7.16.7.tgz"
	"@babel/helper-module-imports/-/helper-module-imports-7.18.6.tgz"
	"@babel/helper-module-transforms/-/helper-module-transforms-7.18.9.tgz"
	"@babel/helper-plugin-utils/-/helper-plugin-utils-7.18.9.tgz"
	"@babel/helpers/-/helpers-7.18.9.tgz"
	"@babel/helper-simple-access/-/helper-simple-access-7.18.6.tgz"
	"@babel/helper-split-export-declaration/-/helper-split-export-declaration-7.18.6.tgz"
	"@babel/helper-string-parser/-/helper-string-parser-7.18.10.tgz"
	"@babel/helper-validator-identifier/-/helper-validator-identifier-7.16.7.tgz"
	"@babel/helper-validator-identifier/-/helper-validator-identifier-7.18.6.tgz"
	"@babel/helper-validator-option/-/helper-validator-option-7.18.6.tgz"
	"@babel/highlight/-/highlight-7.16.10.tgz"
	"@babel/highlight/-/highlight-7.18.6.tgz"
	"@babel/parser/-/parser-7.18.13.tgz"
	"babel-plugin-macros/-/babel-plugin-macros-3.1.0.tgz"
	"@babel/plugin-syntax-jsx/-/plugin-syntax-jsx-7.18.6.tgz"
	"@babel/plugin-transform-react-jsx-development/-/plugin-transform-react-jsx-development-7.18.6.tgz"
	"@babel/plugin-transform-react-jsx/-/plugin-transform-react-jsx-7.18.10.tgz"
	"@babel/plugin-transform-react-jsx-self/-/plugin-transform-react-jsx-self-7.18.6.tgz"
	"@babel/plugin-transform-react-jsx-source/-/plugin-transform-react-jsx-source-7.18.6.tgz"
	"@babel/runtime/-/runtime-7.17.8.tgz"
	"@babel/runtime/-/runtime-7.18.9.tgz"
	"@babel/template/-/template-7.18.10.tgz"
	"@babel/traverse/-/traverse-7.18.13.tgz"
	"@babel/types/-/types-7.17.0.tgz"
	"@babel/types/-/types-7.18.13.tgz"
	"balanced-match/-/balanced-match-1.0.2.tgz"
	"before-after-hook/-/before-after-hook-2.2.2.tgz"
	"binary-extensions/-/binary-extensions-2.2.0.tgz"
	"brace-expansion/-/brace-expansion-1.1.11.tgz"
	"braces/-/braces-3.0.2.tgz"
	"browserslist/-/browserslist-4.20.3.tgz"
	"callsites/-/callsites-3.1.0.tgz"
	"camelcase/-/camelcase-6.3.0.tgz"
	"caniuse-lite/-/caniuse-lite-1.0.30001341.tgz"
	"chalk/-/chalk-2.4.2.tgz"
	"chalk/-/chalk-3.0.0.tgz"
	"chokidar/-/chokidar-3.5.3.tgz"
	"clsx/-/clsx-1.2.1.tgz"
	"color-convert/-/color-convert-1.9.3.tgz"
	"color-convert/-/color-convert-2.0.1.tgz"
	"color-name/-/color-name-1.1.3.tgz"
	"color-name/-/color-name-1.1.4.tgz"
	"combined-stream/-/combined-stream-1.0.8.tgz"
	"concat-map/-/concat-map-0.0.1.tgz"
	"convert-source-map/-/convert-source-map-1.8.0.tgz"
	"cosmiconfig/-/cosmiconfig-7.0.1.tgz"
	"cross-env/-/cross-env-7.0.3.tgz"
	"cross-spawn/-/cross-spawn-7.0.3.tgz"
	"csstype/-/csstype-3.0.11.tgz"
	"csstype/-/csstype-3.1.0.tgz"
	"data-uri-to-buffer/-/data-uri-to-buffer-4.0.0.tgz"
	"dayjs/-/dayjs-1.11.5.tgz"
	"debug/-/debug-4.3.4.tgz"
	"delayed-stream/-/delayed-stream-1.0.0.tgz"
	"deprecation/-/deprecation-2.3.1.tgz"
	"dom-helpers/-/dom-helpers-5.2.1.tgz"
	"electron-to-chromium/-/electron-to-chromium-1.4.137.tgz"
	"@emotion/babel-plugin/-/babel-plugin-11.10.2.tgz"
	"@emotion/cache/-/cache-11.10.3.tgz"
	"@emotion/hash/-/hash-0.9.0.tgz"
	"@emotion/is-prop-valid/-/is-prop-valid-1.2.0.tgz"
	"@emotion/memoize/-/memoize-0.8.0.tgz"
	"@emotion/react/-/react-11.10.4.tgz"
	"@emotion/serialize/-/serialize-1.1.0.tgz"
	"@emotion/sheet/-/sheet-1.2.0.tgz"
	"@emotion/styled/-/styled-11.10.4.tgz"
	"@emotion/unitless/-/unitless-0.8.0.tgz"
	"@emotion/use-insertion-effect-with-fallbacks/-/use-insertion-effect-with-fallbacks-1.0.0.tgz"
	"@emotion/utils/-/utils-1.2.0.tgz"
	"@emotion/weak-memoize/-/weak-memoize-0.3.0.tgz"
	"end-of-stream/-/end-of-stream-1.4.4.tgz"
	"entities/-/entities-4.4.0.tgz"
	"error-ex/-/error-ex-1.3.2.tgz"
	"esbuild-android-64/-/esbuild-android-64-0.14.54.tgz"
	"esbuild-android-arm64/-/esbuild-android-arm64-0.14.54.tgz"
	"esbuild-darwin-64/-/esbuild-darwin-64-0.14.54.tgz"
	"esbuild-darwin-arm64/-/esbuild-darwin-arm64-0.14.54.tgz"
	"esbuild/-/esbuild-0.14.54.tgz"
	"esbuild-freebsd-64/-/esbuild-freebsd-64-0.14.54.tgz"
	"esbuild-freebsd-arm64/-/esbuild-freebsd-arm64-0.14.54.tgz"
	"esbuild-linux-32/-/esbuild-linux-32-0.14.54.tgz"
	"esbuild-linux-64/-/esbuild-linux-64-0.14.54.tgz"
	"esbuild-linux-arm64/-/esbuild-linux-arm64-0.14.54.tgz"
	"esbuild-linux-arm/-/esbuild-linux-arm-0.14.54.tgz"
	"@esbuild/linux-loong64/-/linux-loong64-0.14.54.tgz"
	"esbuild-linux-mips64le/-/esbuild-linux-mips64le-0.14.54.tgz"
	"esbuild-linux-ppc64le/-/esbuild-linux-ppc64le-0.14.54.tgz"
	"esbuild-linux-riscv64/-/esbuild-linux-riscv64-0.14.54.tgz"
	"esbuild-linux-s390x/-/esbuild-linux-s390x-0.14.54.tgz"
	"esbuild-netbsd-64/-/esbuild-netbsd-64-0.14.54.tgz"
	"esbuild-openbsd-64/-/esbuild-openbsd-64-0.14.54.tgz"
	"esbuild-sunos-64/-/esbuild-sunos-64-0.14.54.tgz"
	"esbuild-windows-32/-/esbuild-windows-32-0.14.54.tgz"
	"esbuild-windows-64/-/esbuild-windows-64-0.14.54.tgz"
	"esbuild-windows-arm64/-/esbuild-windows-arm64-0.14.54.tgz"
	"escalade/-/escalade-3.1.1.tgz"
	"escape-string-regexp/-/escape-string-regexp-1.0.5.tgz"
	"escape-string-regexp/-/escape-string-regexp-4.0.0.tgz"
	"estree-walker/-/estree-walker-2.0.2.tgz"
	"execa/-/execa-4.1.0.tgz"
	"fetch-blob/-/fetch-blob-3.1.5.tgz"
	"fill-range/-/fill-range-7.0.1.tgz"
	"find-root/-/find-root-1.1.0.tgz"
	"find-up/-/find-up-4.1.0.tgz"
	"follow-redirects/-/follow-redirects-1.15.1.tgz"
	"form-data/-/form-data-4.0.0.tgz"
	"formdata-polyfill/-/formdata-polyfill-4.0.10.tgz"
	"fsevents/-/fsevents-2.3.2.tgz"
	"fs-extra/-/fs-extra-10.0.1.tgz"
	"function-bind/-/function-bind-1.1.1.tgz"
	"gensync/-/gensync-1.0.0-beta.2.tgz"
	"get-stream/-/get-stream-5.2.0.tgz"
	"globals/-/globals-11.12.0.tgz"
	"glob-parent/-/glob-parent-5.1.2.tgz"
	"graceful-fs/-/graceful-fs-4.2.9.tgz"
	"hamt_plus/-/hamt_plus-1.0.2.tgz"
	"has-flag/-/has-flag-3.0.0.tgz"
	"has-flag/-/has-flag-4.0.0.tgz"
	"has/-/has-1.0.3.tgz"
	"history/-/history-5.3.0.tgz"
	"hoist-non-react-statics/-/hoist-non-react-statics-3.3.2.tgz"
	"html-escaper/-/html-escaper-2.0.2.tgz"
	"html-parse-stringify/-/html-parse-stringify-3.0.1.tgz"
	"https-proxy-agent/-/https-proxy-agent-5.0.1.tgz"
	"human-signals/-/human-signals-1.1.1.tgz"
	"husky/-/husky-7.0.4.tgz"
	"i18next/-/i18next-21.9.1.tgz"
	"ignore/-/ignore-5.2.0.tgz"
	"immutable/-/immutable-4.0.0.tgz"
	"import-fresh/-/import-fresh-3.3.0.tgz"
	"intersection-observer/-/intersection-observer-0.12.0.tgz"
	"is-arrayish/-/is-arrayish-0.2.1.tgz"
	"is-binary-path/-/is-binary-path-2.1.0.tgz"
	"is-core-module/-/is-core-module-2.10.0.tgz"
	"isexe/-/isexe-2.0.0.tgz"
	"is-extglob/-/is-extglob-2.1.1.tgz"
	"is-glob/-/is-glob-4.0.3.tgz"
	"is-number/-/is-number-7.0.0.tgz"
	"is-plain-object/-/is-plain-object-5.0.0.tgz"
	"is-stream/-/is-stream-2.0.1.tgz"
	"@jridgewell/gen-mapping/-/gen-mapping-0.3.2.tgz"
	"@jridgewell/resolve-uri/-/resolve-uri-3.0.5.tgz"
	"@jridgewell/set-array/-/set-array-1.1.2.tgz"
	"@jridgewell/sourcemap-codec/-/sourcemap-codec-1.4.11.tgz"
	"@jridgewell/trace-mapping/-/trace-mapping-0.3.15.tgz"
	"@jridgewell/trace-mapping/-/trace-mapping-0.3.4.tgz"
	"js-cookie/-/js-cookie-2.2.1.tgz"
	"jsesc/-/jsesc-2.5.2.tgz"
	"json5/-/json5-2.2.1.tgz"
	"jsonfile/-/jsonfile-6.1.0.tgz"
	"json-parse-even-better-errors/-/json-parse-even-better-errors-2.3.1.tgz"
	"js-tokens/-/js-tokens-4.0.0.tgz"
	"lines-and-columns/-/lines-and-columns-1.2.4.tgz"
	"locate-path/-/locate-path-5.0.0.tgz"
	"lodash/-/lodash-4.17.21.tgz"
	"loose-envify/-/loose-envify-1.4.0.tgz"
	"magic-string/-/magic-string-0.26.3.tgz"
	"merge-stream/-/merge-stream-2.0.0.tgz"
	"mime-db/-/mime-db-1.52.0.tgz"
	"mime-types/-/mime-types-2.1.35.tgz"
	"mimic-fn/-/mimic-fn-2.1.0.tgz"
	"minimatch/-/minimatch-3.1.2.tgz"
	"monaco-editor/-/monaco-editor-0.34.0.tgz"
	"mri/-/mri-1.2.0.tgz"
	"ms/-/ms-2.1.2.tgz"
	"@mui/base/-/base-5.0.0-alpha.95.tgz"
	"@mui/core-downloads-tracker/-/core-downloads-tracker-5.10.3.tgz"
	"@mui/icons-material/-/icons-material-5.10.3.tgz"
	"@mui/material/-/material-5.10.3.tgz"
	"@mui/private-theming/-/private-theming-5.10.3.tgz"
	"@mui/styled-engine/-/styled-engine-5.10.3.tgz"
	"@mui/system/-/system-5.10.3.tgz"
	"@mui/types/-/types-7.2.0.tgz"
	"@mui/utils/-/utils-5.10.3.tgz"
	"multimatch/-/multimatch-4.0.0.tgz"
	"nanoid/-/nanoid-3.3.4.tgz"
	"node-domexception/-/node-domexception-1.0.0.tgz"
	"node-fetch/-/node-fetch-2.6.7.tgz"
	"node-fetch/-/node-fetch-3.2.6.tgz"
	"node-releases/-/node-releases-2.0.4.tgz"
	"normalize-path/-/normalize-path-3.0.0.tgz"
	"npm-run-path/-/npm-run-path-4.0.1.tgz"
	"object-assign/-/object-assign-4.1.1.tgz"
	"@octokit/auth-token/-/auth-token-2.5.0.tgz"
	"@octokit/core/-/core-3.6.0.tgz"
	"@octokit/endpoint/-/endpoint-6.0.12.tgz"
	"@octokit/graphql/-/graphql-4.8.0.tgz"
	"@octokit/openapi-types/-/openapi-types-11.2.0.tgz"
	"@octokit/plugin-paginate-rest/-/plugin-paginate-rest-2.17.0.tgz"
	"@octokit/plugin-rest-endpoint-methods/-/plugin-rest-endpoint-methods-5.13.0.tgz"
	"@octokit/request-error/-/request-error-2.1.0.tgz"
	"@octokit/request/-/request-5.6.3.tgz"
	"@octokit/types/-/types-6.34.0.tgz"
	"once/-/once-1.4.0.tgz"
	"onetime/-/onetime-5.1.2.tgz"
	"parent-module/-/parent-module-1.0.1.tgz"
	"parse-json/-/parse-json-5.2.0.tgz"
	"path-exists/-/path-exists-4.0.0.tgz"
	"path-key/-/path-key-3.1.1.tgz"
	"path-parse/-/path-parse-1.0.7.tgz"
	"path-type/-/path-type-4.0.0.tgz"
	"picocolors/-/picocolors-1.0.0.tgz"
	"picomatch/-/picomatch-2.3.1.tgz"
	"p-limit/-/p-limit-2.3.0.tgz"
	"p-locate/-/p-locate-4.1.0.tgz"
	"@popperjs/core/-/core-2.11.6.tgz"
	"postcss/-/postcss-8.4.16.tgz"
	"prettier/-/prettier-2.7.1.tgz"
	"pretty-quick/-/pretty-quick-3.1.3.tgz"
	"prop-types/-/prop-types-15.8.1.tgz"
	"p-try/-/p-try-2.2.0.tgz"
	"pump/-/pump-3.0.0.tgz"
	"react-dom/-/react-dom-17.0.2.tgz"
	"react-i18next/-/react-i18next-11.17.4.tgz"
	"react-is/-/react-is-16.13.1.tgz"
	"react-is/-/react-is-18.2.0.tgz"
	"react/-/react-17.0.2.tgz"
	"react-refresh/-/react-refresh-0.14.0.tgz"
	"react-router-dom/-/react-router-dom-6.3.0.tgz"
	"react-router/-/react-router-6.3.0.tgz"
	"react-transition-group/-/react-transition-group-4.4.5.tgz"
	"react-virtuoso/-/react-virtuoso-2.17.2.tgz"
	"readdirp/-/readdirp-3.6.0.tgz"
	"recoil/-/recoil-0.7.5.tgz"
	"regenerator-runtime/-/regenerator-runtime-0.13.9.tgz"
	"resize-observer-polyfill/-/resize-observer-polyfill-1.5.1.tgz"
	"resolve-from/-/resolve-from-4.0.0.tgz"
	"resolve/-/resolve-1.22.1.tgz"
	"@rollup/pluginutils/-/pluginutils-4.2.1.tgz"
	"rollup/-/rollup-2.77.3.tgz"
	"safe-buffer/-/safe-buffer-5.1.2.tgz"
	"sass/-/sass-1.54.8.tgz"
	"scheduler/-/scheduler-0.20.2.tgz"
	"screenfull/-/screenfull-5.2.0.tgz"
	"semver/-/semver-6.3.0.tgz"
	"shebang-command/-/shebang-command-2.0.0.tgz"
	"shebang-regex/-/shebang-regex-3.0.0.tgz"
	"signal-exit/-/signal-exit-3.0.7.tgz"
	"snarkdown/-/snarkdown-2.0.0.tgz"
	"sourcemap-codec/-/sourcemap-codec-1.4.8.tgz"
	"source-map-js/-/source-map-js-1.0.2.tgz"
	"source-map/-/source-map-0.5.7.tgz"
	"strip-final-newline/-/strip-final-newline-2.0.0.tgz"
	"stylis/-/stylis-4.0.13.tgz"
	"supports-color/-/supports-color-5.5.0.tgz"
	"supports-color/-/supports-color-7.2.0.tgz"
	"supports-preserve-symlinks-flag/-/supports-preserve-symlinks-flag-1.0.0.tgz"
	"svg-parser/-/svg-parser-2.0.4.tgz"
	"@svgr/babel-plugin-add-jsx-attribute/-/babel-plugin-add-jsx-attribute-6.3.1.tgz"
	"@svgr/babel-plugin-remove-jsx-attribute/-/babel-plugin-remove-jsx-attribute-6.3.1.tgz"
	"@svgr/babel-plugin-remove-jsx-empty-expression/-/babel-plugin-remove-jsx-empty-expression-6.3.1.tgz"
	"@svgr/babel-plugin-replace-jsx-attribute-value/-/babel-plugin-replace-jsx-attribute-value-6.3.1.tgz"
	"@svgr/babel-plugin-svg-dynamic-title/-/babel-plugin-svg-dynamic-title-6.3.1.tgz"
	"@svgr/babel-plugin-svg-em-dimensions/-/babel-plugin-svg-em-dimensions-6.3.1.tgz"
	"@svgr/babel-plugin-transform-react-native-svg/-/babel-plugin-transform-react-native-svg-6.3.1.tgz"
	"@svgr/babel-plugin-transform-svg-component/-/babel-plugin-transform-svg-component-6.3.1.tgz"
	"@svgr/babel-preset/-/babel-preset-6.3.1.tgz"
	"@svgr/core/-/core-6.3.1.tgz"
	"@svgr/hast-util-to-babel-ast/-/hast-util-to-babel-ast-6.3.1.tgz"
	"@svgr/plugin-jsx/-/plugin-jsx-6.3.1.tgz"
	"swr/-/swr-1.3.0.tgz"
	"@tauri-apps/api/-/api-1.0.2.tgz"
	"@tauri-apps/cli/-/cli-1.0.5.tgz"
	"@tauri-apps/cli-darwin-arm64/-/cli-darwin-arm64-1.0.5.tgz"
	"@tauri-apps/cli-darwin-x64/-/cli-darwin-x64-1.0.5.tgz"
	"@tauri-apps/cli-linux-arm64-gnu/-/cli-linux-arm64-gnu-1.0.5.tgz"
	"@tauri-apps/cli-linux-arm64-musl/-/cli-linux-arm64-musl-1.0.5.tgz"
	"@tauri-apps/cli-linux-arm-gnueabihf/-/cli-linux-arm-gnueabihf-1.0.5.tgz"
	"@tauri-apps/cli-linux-x64-gnu/-/cli-linux-x64-gnu-1.0.5.tgz"
	"@tauri-apps/cli-linux-x64-musl/-/cli-linux-x64-musl-1.0.5.tgz"
	"@tauri-apps/cli-win32-ia32-msvc/-/cli-win32-ia32-msvc-1.0.5.tgz"
	"@tauri-apps/cli-win32-x64-msvc/-/cli-win32-x64-msvc-1.0.5.tgz"
	"to-fast-properties/-/to-fast-properties-2.0.0.tgz"
	"to-regex-range/-/to-regex-range-5.0.1.tgz"
	"tr46/-/tr46-0.0.3.tgz"
	"tunnel/-/tunnel-0.0.6.tgz"
	"typescript/-/typescript-4.7.4.tgz"
	"@types/fs-extra/-/fs-extra-9.0.13.tgz"
	"@types/js-cookie/-/js-cookie-2.2.7.tgz"
	"@types/js-cookie/-/js-cookie-3.0.2.tgz"
	"@types/lodash/-/lodash-4.14.180.tgz"
	"@types/minimatch/-/minimatch-3.0.5.tgz"
	"@types/node/-/node-17.0.23.tgz"
	"@types/parse-json/-/parse-json-4.0.0.tgz"
	"@types/prop-types/-/prop-types-15.7.4.tgz"
	"@types/prop-types/-/prop-types-15.7.5.tgz"
	"@types/react-dom/-/react-dom-17.0.14.tgz"
	"@types/react-is/-/react-is-17.0.3.tgz"
	"@types/react/-/react-17.0.43.tgz"
	"@types/react-transition-group/-/react-transition-group-4.4.5.tgz"
	"@types/scheduler/-/scheduler-0.16.2.tgz"
	"universalify/-/universalify-2.0.0.tgz"
	"universal-user-agent/-/universal-user-agent-6.0.0.tgz"
	"@virtuoso.dev/react-urx/-/react-urx-0.2.13.tgz"
	"@virtuoso.dev/urx/-/urx-0.2.13.tgz"
	"@vitejs/plugin-react/-/plugin-react-2.0.1.tgz"
	"vite-plugin-monaco-editor/-/vite-plugin-monaco-editor-1.1.0.tgz"
	"vite-plugin-svgr/-/vite-plugin-svgr-2.2.1.tgz"
	"vite/-/vite-3.0.9.tgz"
	"void-elements/-/void-elements-3.1.0.tgz"
	"webidl-conversions/-/webidl-conversions-3.0.1.tgz"
	"web-streams-polyfill/-/web-streams-polyfill-3.2.0.tgz"
	"whatwg-url/-/whatwg-url-5.0.0.tgz"
	"which/-/which-2.0.2.tgz"
	"wrappy/-/wrappy-1.0.2.tgz"
	"yaml/-/yaml-1.10.2.tgz"
)

inherit cargo yarn desktop xdg

yarn_set_globals

DESCRIPTION="A Clash GUI based on tauri"
HOMEPAGE="https://github.com/zzzgydi/clash-verge"

MMDB_V="20220912"

SRC_URI="
	https://github.com/zzzgydi/clash-verge/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/Dreamacro/maxmind-geoip/releases/download/${MMDB_V}/Country.mmdb -> clash-country-${MMDB_V}.mmdb
	$(cargo_crate_uris ${CRATES})
	${EYARN_LOCK_SRC_URI}
"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"
RESTRICT="test" # cargo-tauri-test

DEPEND="
	dev-libs/glib:2
	dev-libs/openssl:=
	net-proxy/clash
	net-proxy/clash-meta
	dev-libs/libappindicator
	net-libs/webkit-gtk:4=
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-util/cargo-tauri-1.0.4
	dev-lang/typescript
	sys-apps/yarn
"

# disable Appimage & .deb creation
# remove requirement of bundled clash & clash-meta binaries
PATCHES=(
	"${FILESDIR}/${P}-disable-release-bundle-creation.patch"
)

pkg_pretend() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		npmmirrorset=0
		if [[ -e "${ROOT}"/etc/portage/mirrors ]]; then
			grep '^\s*yarn\s' "${ROOT}"/etc/portage/mirrors >/dev/null 2>&1
			if [[ $? -eq 0 ]]; then
				npmmirrorset=1
			fi
		fi
		if [[ ${npmmirrorset} -eq 0 ]]; then
			ewarn "You may need to set a yarn mirror for fetching yarn packages"
			ewarn "  echo -e '\\\\nyarn https://registry.npmmirror.com/' >> /etc/portage/mirrors"
			ewarn "Can safely ignore this warning if emerge succeeded."
		fi
	fi
}

src_unpack() {
	unpack "${P}.tar.gz"

	# modified cargo_src_unpack
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

	yarn_set_offline_mirror
}

src_prepare() {
	default
	yarn_offline_install

	mkdir -pv src-tauri/resources || die
	cp -v "${DISTDIR}/clash-country-${MMDB_V}.mmdb" src-tauri/resources/Country.mmdb || die
}

src_compile() {
	cargo-tauri build || die "cargo tauri build failed"
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
