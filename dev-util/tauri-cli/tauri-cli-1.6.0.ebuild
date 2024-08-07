# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.13.3

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aead@0.5.2
	aes-gcm@0.10.3
	aes@0.8.3
	ahash@0.8.6
	aho-corasick@1.1.2
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anstyle@1.0.4
	anyhow@1.0.75
	ar@0.9.0
	async-trait@0.1.74
	autocfg@1.1.0
	axum-core@0.3.4
	axum@0.6.20
	backtrace@0.3.69
	base16ct@0.2.0
	base64@0.21.5
	base64ct@1.6.0
	bit-set@0.5.3
	bit-vec@0.6.3
	bit_field@0.10.2
	bitfield@0.14.0
	bitflags@1.3.2
	bitflags@2.4.1
	block-buffer@0.10.4
	block-padding@0.3.3
	blowfish@0.9.1
	bstr@1.8.0
	buffer-redux@1.0.1
	bumpalo@3.14.0
	bytecount@0.6.7
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	bzip2-sys@0.1.11+1.0.8
	bzip2@0.4.4
	camellia@0.1.0
	cast5@0.11.1
	cc@1.0.83
	cfb-mode@0.8.2
	cfb@0.7.3
	cfg-if@1.0.0
	chrono@0.4.31
	cipher@0.4.4
	clap@4.4.10
	clap_builder@4.4.9
	clap_complete@4.4.4
	clap_derive@4.4.7
	clap_lex@0.6.0
	color_quant@1.1.0
	colorchoice@1.0.0
	colored@2.0.4
	common-path@1.0.0
	console@0.15.7
	const-oid@0.9.6
	constant_time_eq@0.1.5
	convert_case@0.4.0
	convert_case@0.6.0
	core-foundation-sys@0.8.6
	core-foundation@0.9.4
	cpio@0.2.2
	cpufeatures@0.2.11
	crc24@0.1.6
	crc32fast@1.3.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-utils@0.8.16
	crunchy@0.2.2
	crypto-bigint@0.5.5
	crypto-common@0.1.6
	cssparser-macros@0.6.1
	cssparser@0.27.2
	ctor@0.2.5
	ctr@0.9.2
	ctrlc@3.4.1
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.2
	darling@0.14.4
	darling@0.20.3
	darling_core@0.14.4
	darling_core@0.20.3
	darling_macro@0.14.4
	darling_macro@0.20.3
	data-encoding@2.5.0
	der@0.7.9
	deranged@0.3.9
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	derive_more@0.99.17
	des@0.8.1
	dialoguer@0.11.0
	digest@0.10.7
	dirs-next@2.0.0
	dirs-sys-next@0.1.2
	dsa@0.6.3
	dtoa-short@0.3.4
	dtoa@1.0.9
	dunce@1.0.4
	dyn-clone@1.0.16
	ecdsa@0.16.9
	ed25519-dalek@2.1.1
	ed25519@2.2.3
	either@1.9.0
	elliptic-curve@0.13.8
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	enum-display-derive@0.1.1
	enum-primitive-derive@0.3.0
	env_logger@0.10.1
	equivalent@1.0.1
	erased-serde@0.4.3
	errno@0.3.8
	exr@1.71.0
	fancy-regex@0.11.0
	fastrand@2.0.1
	fdeflate@0.3.1
	ff@0.13.0
	fiat-crypto@0.2.9
	filetime@0.2.22
	flate2@1.0.28
	flume@0.11.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fraction@0.13.1
	fsevent-sys@4.1.0
	futf@0.1.5
	futures-channel@0.3.29
	futures-core@0.3.29
	futures-io@0.3.29
	futures-sink@0.3.29
	futures-task@0.3.29
	futures-util@0.3.29
	fxhash@0.2.1
	generic-array@0.14.7
	getrandom@0.1.16
	getrandom@0.2.11
	ghash@0.5.0
	gif@0.12.0
	gimli@0.28.1
	glob@0.3.1
	globset@0.4.14
	group@0.13.0
	h2@0.3.22
	half@2.2.1
	handlebars@4.5.0
	hashbrown@0.12.3
	hashbrown@0.14.3
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.3
	hex@0.4.3
	hkdf@0.12.4
	hmac@0.12.1
	html5ever@0.26.0
	http-body@0.4.5
	http@0.2.11
	httparse@1.8.0
	httpdate@1.0.3
	humantime@2.1.0
	hyper@0.14.27
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.58
	idea@0.5.1
	ident_case@1.0.1
	idna@0.5.0
	ignore@0.4.21
	image@0.24.7
	include_dir@0.7.3
	include_dir_macros@0.7.3
	indexmap@1.9.3
	indexmap@2.1.0
	infer@0.13.0
	inotify-sys@0.1.5
	inotify@0.9.6
	inout@0.1.3
	ipnet@2.9.0
	is-terminal@0.4.9
	iso8601@0.6.1
	iter-read@1.0.1
	itertools@0.11.0
	itertools@0.12.1
	itoa@0.4.8
	itoa@1.0.9
	jobserver@0.1.27
	jpeg-decoder@0.3.0
	js-sys@0.3.66
	json-patch@1.2.0
	json5@0.4.1
	jsonschema@0.17.1
	k256@0.13.3
	keccak@0.1.5
	kqueue-sys@1.0.4
	kqueue@1.0.8
	kuchikiki@0.8.2
	lazy_static@1.4.0
	lebe@0.5.2
	libc@0.2.150
	libloading@0.8.1
	libm@0.2.8
	libredox@0.0.1
	line-wrap@0.1.1
	linux-raw-sys@0.4.12
	lock_api@0.4.11
	log@0.4.21
	lzma-sys@0.1.20
	mac@0.1.1
	markup5ever@0.11.0
	matches@0.1.10
	matchit@0.7.3
	md-5@0.10.6
	md5@0.7.0
	memchr@2.6.4
	memoffset@0.9.0
	mime@0.3.17
	minimal-lexical@0.2.1
	minisign@0.7.3
	miniz_oxide@0.7.1
	mio@0.8.9
	napi-build@2.1.0
	napi-derive-backend@1.0.55
	napi-derive@2.14.2
	napi-sys@2.3.0
	napi@2.14.1
	native-tls@0.2.11
	new_debug_unreachable@1.0.4
	nix@0.27.1
	nodrop@0.1.14
	nom@7.1.3
	notify-debouncer-mini@0.4.1
	notify@6.1.1
	num-bigint-dig@0.8.4
	num-bigint@0.4.4
	num-cmp@0.1.0
	num-complex@0.4.4
	num-derive@0.4.2
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.4.1
	num-traits@0.2.17
	num@0.4.1
	num_cpus@1.16.0
	num_enum@0.7.2
	num_enum_derive@0.7.2
	object@0.32.1
	once_cell@1.19.0
	opaque-debug@0.3.0
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.1.6+3.1.4
	openssl-sys@0.9.96
	openssl@0.10.60
	ordered-float@2.10.1
	os_info@3.7.0
	os_pipe@1.1.4
	p256@0.13.2
	p384@0.13.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	password-hash@0.4.2
	pbkdf2@0.11.0
	pbkdf2@0.12.2
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	pest@2.7.5
	pest_derive@2.7.5
	pest_generator@2.7.5
	pest_meta@2.7.5
	pgp@0.11.0
	phf@0.10.1
	phf@0.11.2
	phf@0.8.0
	phf_codegen@0.10.0
	phf_codegen@0.8.0
	phf_generator@0.10.0
	phf_generator@0.11.2
	phf_generator@0.8.0
	phf_macros@0.11.2
	phf_macros@0.8.0
	phf_shared@0.10.0
	phf_shared@0.11.2
	phf_shared@0.8.0
	pin-project-internal@1.1.3
	pin-project-lite@0.2.13
	pin-project@1.1.3
	pin-utils@0.1.0
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.27
	platforms@3.4.0
	plist@1.6.0
	png@0.17.10
	polyval@0.6.1
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	precomputed-hash@0.1.1
	primeorder@0.13.6
	proc-macro-crate@3.1.0
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.78
	qoi@0.4.1
	quick-xml@0.31.0
	quote@1.0.35
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_hc@0.2.0
	rand_pcg@0.2.1
	rayon-core@1.12.0
	rayon@1.8.0
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	redox_users@0.4.4
	regex-automata@0.4.3
	regex-syntax@0.8.2
	regex@1.10.2
	reqwest@0.11.22
	rfc6979@0.4.0
	ring@0.17.6
	ripemd@0.1.3
	rpassword@7.3.1
	rpm@0.14.0
	rsa@0.9.6
	rtoolbox@0.0.2
	rustc-demangle@0.1.23
	rustc_version@0.4.0
	rustix@0.38.26
	rustls-webpki@0.101.7
	rustls@0.21.9
	rustversion@1.0.14
	ryu@1.0.15
	safemem@0.3.3
	salsa20@0.10.2
	same-file@1.0.6
	schannel@0.1.22
	schemars@0.8.19
	schemars_derive@0.8.19
	scopeguard@1.2.0
	scrypt@0.11.0
	sct@0.7.1
	sec1@0.7.3
	security-framework-sys@2.9.1
	security-framework@2.9.2
	selectors@0.22.0
	semver@1.0.20
	serde-value@0.7.0
	serde@1.0.197
	serde_derive@1.0.197
	serde_derive_internals@0.29.0
	serde_fmt@1.0.3
	serde_json@1.0.108
	serde_path_to_error@0.1.14
	serde_spanned@0.6.4
	serde_urlencoded@0.7.1
	serde_with@3.4.0
	serde_with_macros@3.4.0
	serialize-to-javascript-impl@0.1.1
	serialize-to-javascript@0.1.1
	servo_arc@0.1.1
	sha1@0.10.6
	sha1_smol@1.0.0
	sha2@0.10.8
	sha3@0.10.8
	shared_child@1.0.0
	shell-words@1.1.0
	signature@2.2.0
	simd-adler32@0.3.7
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.11.2
	socket2@0.4.10
	socket2@0.5.5
	socks@0.3.4
	spin@0.5.2
	spin@0.9.8
	spki@0.7.3
	stable_deref_trait@1.2.0
	string_cache@0.8.7
	string_cache_codegen@0.5.2
	strsim@0.10.0
	subtle@2.5.0
	sval@2.10.2
	sval_buffer@2.10.2
	sval_dynamic@2.10.2
	sval_fmt@2.10.2
	sval_json@2.10.2
	sval_ref@2.10.2
	sval_serde@2.10.2
	syn@1.0.109
	syn@2.0.52
	sync_wrapper@0.1.2
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	tar@0.4.40
	tauri-icns@0.1.0
	tempfile@3.8.1
	tendril@0.4.3
	termcolor@1.4.0
	thin-slice@0.1.1
	thiserror-impl@1.0.50
	thiserror@1.0.50
	tiff@0.9.0
	time-core@0.1.2
	time-macros@0.2.15
	time@0.3.30
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio-macros@2.2.0
	tokio-tungstenite@0.20.1
	tokio-util@0.7.10
	tokio@1.34.0
	toml@0.7.8
	toml@0.8.8
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.21.0
	tower-layer@0.3.2
	tower-service@0.3.2
	tower@0.4.13
	tracing-core@0.1.32
	tracing@0.1.40
	treediff@4.0.2
	try-lock@0.2.4
	tungstenite@0.20.1
	twofish@0.7.1
	typenum@1.17.0
	ucd-trie@0.1.6
	unicode-bidi@0.3.13
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	universal-hash@0.5.1
	untrusted@0.9.0
	ureq@2.9.1
	url@2.5.0
	utf-8@0.7.6
	utf8parse@0.2.1
	uuid@1.6.1
	value-bag-serde1@1.7.0
	value-bag-sval2@1.7.0
	value-bag@1.7.0
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.89
	wasm-bindgen-futures@0.4.39
	wasm-bindgen-macro-support@0.2.89
	wasm-bindgen-macro@0.2.89
	wasm-bindgen-shared@0.2.89
	wasm-bindgen@0.2.89
	web-sys@0.3.66
	webpki-roots@0.25.3
	weezl@0.1.7
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.51.1
	windows-registry@0.1.2
	windows-result@0.1.2
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows-targets@0.52.5
	windows-version@0.1.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.5
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.5
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.5
	windows_i686_gnullvm@0.52.5
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.5
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.5
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.5
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.5
	winnow@0.5.19
	winreg@0.50.0
	x25519-dalek@2.0.1
	xattr@1.0.1
	xz2@0.1.7
	zerocopy-derive@0.7.27
	zerocopy@0.7.27
	zeroize@1.7.0
	zeroize_derive@1.4.2
	zip@0.6.6
	zstd-safe@5.0.2+zstd.1.5.2
	zstd-safe@7.1.0
	zstd-sys@2.0.10+zstd.1.5.6
	zstd@0.11.2+zstd.1.5.2
	zstd@0.13.1
	zune-inflate@0.2.54
"

inherit cargo

DESCRIPTION="Command line interface for building Tauri apps"
HOMEPAGE="https://tauri.app"
SRC_URI="
	https://github.com/tauri-apps/tauri/archive/refs/tags/tauri-cli-v${PV}.tar.gz
	${CARGO_CRATE_URIS}
"
S="${WORKDIR}/tauri-tauri-cli-v${PV}/tooling/cli"

LICENSE="|| ( Apache-2.0 MIT )"
# Dependent crate licenses
LICENSE+=" Apache-2.0 BSD CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 ZLIB"
SLOT="0"
KEYWORDS="~amd64"
