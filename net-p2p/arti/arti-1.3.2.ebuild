# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	aes@0.8.4
	ahash@0.8.11
	aho-corasick@1.1.3
	amplify@4.8.0
	amplify_derive@4.0.1
	amplify_num@0.5.3
	amplify_syn@2.0.1
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	anyhow@1.0.95
	approx@0.5.1
	arbitrary@1.4.1
	arrayvec@0.7.6
	ascii@1.1.0
	asn1-rs-derive@0.5.1
	asn1-rs-impl@0.2.0
	asn1-rs@0.6.2
	assert-impl@0.1.3
	assert_matches@1.5.0
	async-broadcast@0.7.2
	async-channel@1.9.0
	async-channel@2.3.1
	async-compression@0.4.18
	async-ctrlc@1.2.0
	async-executor@1.13.1
	async-global-executor@2.4.1
	async-io@1.13.0
	async-io@2.4.0
	async-lock@2.8.0
	async-lock@3.4.0
	async-native-tls@0.5.0
	async-process@2.3.0
	async-signal@0.2.10
	async-std@1.13.0
	async-task@4.7.1
	async-trait@0.1.85
	async_executors@0.7.0
	asynchronous-codec@0.7.0
	atomic-waker@1.1.2
	atomic@0.5.3
	atomic@0.6.0
	autocfg@1.4.0
	automod@1.0.14
	axum-core@0.4.5
	axum@0.7.9
	backtrace@0.3.74
	base16ct@0.2.0
	base32@0.5.1
	base64@0.22.1
	base64ct@1.6.0
	bitflags@1.3.2
	bitflags@2.6.0
	bitvec@1.0.1
	blake2@0.10.6
	blanket@0.3.0
	block-buffer@0.10.4
	blocking@1.6.1
	bounded-vec-deque@0.1.1
	bstr@1.11.3
	bumpalo@3.16.0
	by_address@1.2.1
	bytemuck@1.21.0
	byteorder@1.5.0
	bytes@1.9.0
	cast@0.3.0
	cc@1.2.7
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	chrono@0.4.39
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	cipher@0.4.4
	clap@4.5.23
	clap_builder@4.5.23
	clap_derive@4.5.18
	clap_lex@0.7.4
	coarsetime@0.1.35
	colorchoice@1.0.3
	concurrent-queue@2.5.0
	console@0.15.10
	const-oid@0.9.6
	content_inspector@0.2.4
	convert_case@0.6.0
	cookie-factory@0.3.3
	core-foundation-sys@0.8.7
	core-foundation@0.9.4
	cpu-time@1.0.0
	cpufeatures@0.2.16
	crc32fast@1.4.2
	criterion-plot@0.5.0
	criterion@0.5.1
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crunchy@0.2.2
	crypto-bigint@0.5.5
	crypto-common@0.1.6
	ctr@0.9.2
	ctrlc@3.4.5
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.3
	darling@0.14.4
	darling@0.20.10
	darling_core@0.14.4
	darling_core@0.20.10
	darling_macro@0.14.4
	darling_macro@0.20.10
	data-encoding@2.6.0
	der-parser@9.0.0
	der@0.7.9
	deranged@0.3.11
	derive-deftly-macros@0.14.2
	derive-deftly@0.14.2
	derive_arbitrary@1.4.1
	derive_builder_core_fork_arti@0.11.2
	derive_builder_fork_arti@0.11.2
	derive_builder_macro_fork_arti@0.11.2
	derive_more-impl@1.0.0
	derive_more@1.0.0
	dialoguer@0.11.0
	digest@0.10.7
	directories@5.0.1
	dirs-sys@0.4.1
	dirs@5.0.1
	displaydoc@0.2.5
	downcast-rs@1.2.1
	dsa@0.6.3
	dunce@1.0.5
	dyn-clone@1.0.17
	dynasm@3.0.1
	dynasmrt@3.0.1
	ecdsa@0.16.9
	ed25519-dalek@2.1.1
	ed25519@2.2.3
	educe@0.4.23
	either@1.13.0
	elliptic-curve@0.13.8
	encode_unicode@1.0.0
	enum-as-inner@0.6.1
	enum-ordinalize@3.1.15
	equivalent@1.0.1
	erased-serde@0.4.5
	errno@0.3.10
	event-listener-strategy@0.5.3
	event-listener@2.5.3
	event-listener@5.3.1
	fallible-iterator@0.3.0
	fallible-streaming-iterator@0.1.9
	fast-socks5@0.10.0
	fastrand@1.9.0
	fastrand@2.3.0
	ff@0.13.0
	fiat-crypto@0.2.9
	figment@0.10.19
	filetime@0.2.25
	fixed-capacity-vec@1.0.1
	flate2@1.0.35
	float-cmp@0.10.0
	float-ord@0.3.2
	float_eq@1.0.1
	fluid-let@1.0.0
	fnv@1.0.7
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fslock-arti-fork@0.2.0
	fslock@0.2.1
	funty@2.0.0
	futures-await-test-macro@0.3.0
	futures-await-test@0.3.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-lite@1.13.0
	futures-lite@2.5.0
	futures-macro@0.3.31
	futures-rustls@0.26.0
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	gimli@0.31.1
	glob-match@0.2.1
	glob@0.3.2
	gloo-timers@0.3.0
	group@0.13.0
	growable-bloom-filter@2.1.1
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.9.1
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex-literal@0.4.1
	hex@0.4.3
	hickory-proto@0.24.2
	hkdf@0.12.4
	hmac@0.12.1
	hostname-validator@1.1.1
	http-body-util@0.1.2
	http-body@1.0.1
	http@1.2.0
	httparse@1.9.5
	httpdate@1.0.3
	humantime-serde@1.1.1
	humantime@2.1.0
	hyper-util@0.1.10
	hyper@1.5.2
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	indexmap@1.9.3
	indexmap@2.7.0
	inotify-sys@0.1.5
	inotify@0.10.2
	inout@0.1.3
	instant@0.1.13
	inventory@0.3.16
	io-extras@0.18.4
	io-lifetimes@1.0.11
	io-lifetimes@2.0.4
	ipnet@2.10.1
	is-terminal@0.4.13
	is_terminal_polyfill@1.70.1
	itertools@0.10.5
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.14
	jobserver@0.1.32
	js-sys@0.3.76
	k12@0.3.0
	keccak@0.1.5
	kqueue-sys@1.0.4
	kqueue@1.0.8
	kv-log-macro@1.0.7
	lazy_static@1.5.0
	libc@0.2.169
	libm@0.2.11
	libredox@0.1.3
	libsqlite3-sys@0.30.1
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.14
	litemap@0.7.4
	lock_api@0.4.12
	log@0.4.22
	lzma-sys@0.1.20
	matchers@0.1.0
	matchit@0.7.3
	matrixmultiply@0.3.9
	memchr@2.7.4
	memmap2@0.9.5
	merlin@3.0.0
	mime@0.3.17
	minimal-lexical@0.2.1
	miniz_oxide@0.8.2
	mio@1.0.3
	nalgebra@0.33.2
	native-tls@0.2.12
	nix@0.29.0
	nom@7.1.3
	normalize-line-endings@0.3.0
	notify-types@1.0.1
	notify@7.0.0
	nu-ansi-term@0.46.0
	num-bigint-dig@0.8.4
	num-bigint@0.4.6
	num-complex@0.4.6
	num-conv@0.1.0
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.4.2
	num-traits@0.2.19
	num_enum@0.7.3
	num_enum_derive@0.7.3
	object@0.36.7
	once_cell@1.20.2
	oorandom@11.1.4
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-src@300.4.1+3.4.0
	openssl-sys@0.9.104
	openssl@0.10.68
	option-ext@0.2.0
	ordered-float@2.10.1
	os_pipe@1.2.1
	os_str_bytes@6.6.1
	overload@0.1.1
	p256@0.13.2
	p384@0.13.0
	p521@0.13.3
	parking@2.2.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	permutohedron@0.2.4
	phf@0.11.3
	phf_generator@0.11.3
	phf_macros@0.11.3
	phf_shared@0.11.3
	pico-args@0.5.0
	pin-project-internal@1.1.8
	pin-project-lite@0.2.16
	pin-project@1.1.8
	pin-utils@0.1.0
	piper@0.2.4
	pkcs1@0.7.5
	pkcs8@0.10.2
	pkg-config@0.3.31
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	polling@2.8.0
	polling@3.7.4
	postage@0.5.0
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	primeorder@0.13.6
	priority-queue@2.1.1
	proc-macro-crate@3.2.0
	proc-macro-error-attr2@2.0.0
	proc-macro-error2@2.0.1
	proc-macro2@1.0.92
	pwd-grp@1.0.0
	quote@1.0.38
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	rangemap@1.5.1
	rawpointer@0.2.1
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.8
	redox_users@0.4.6
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	rfc6979@0.4.0
	ring@0.16.20
	ring@0.17.8
	rlimit@0.10.2
	rmp-serde@1.3.0
	rmp@0.8.14
	rsa@0.9.7
	rusqlite@0.32.1
	rustc-demangle@0.1.24
	rustc_version@0.4.1
	rusticata-macros@4.1.0
	rustix@0.37.27
	rustix@0.38.42
	rustls-pki-types@1.10.1
	rustls-webpki@0.102.8
	rustls@0.23.20
	rustversion@1.0.19
	ryu@1.0.18
	safe_arch@0.7.4
	same-file@1.0.6
	sanitize-filename@0.6.0
	scc@2.3.0
	schannel@0.1.27
	scopeguard@1.2.0
	sdd@3.0.5
	sec1@0.7.3
	secmem-proc@0.3.5
	security-framework-sys@2.13.0
	security-framework@2.11.1
	semver@1.0.24
	serde-value@0.7.0
	serde@1.0.217
	serde_bytes@0.11.15
	serde_derive@1.0.217
	serde_ignored@0.1.10
	serde_json@1.0.135
	serde_path_to_error@0.1.16
	serde_spanned@0.6.8
	serde_test@1.0.177
	serde_urlencoded@0.7.1
	serde_with@3.12.0
	serde_with_macros@3.12.0
	serial_test@3.2.0
	serial_test_derive@3.2.0
	sha1-asm@0.5.3
	sha1@0.10.6
	sha2@0.10.8
	sha3@0.10.8
	sharded-slab@0.1.7
	shell-words@1.1.0
	shellexpand@3.1.0
	shlex@1.3.0
	signal-hook-async-std@0.2.2
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	signature@2.2.0
	simba@0.9.0
	similar@2.6.0
	siphasher@1.0.1
	slab@0.4.9
	slotmap@1.0.7
	smallvec@1.13.2
	snapbox-macros@0.3.10
	snapbox@0.6.21
	socket2@0.4.10
	socket2@0.5.8
	socketpair@0.19.5
	spin@0.5.2
	spin@0.9.8
	spki@0.7.3
	ssh-cipher@0.2.0
	ssh-encoding@0.2.0
	ssh-key@0.6.7
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	statrs@0.18.0
	strsim@0.10.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	subtle@2.6.1
	syn@1.0.109
	syn@2.0.95
	sync_wrapper@1.0.2
	synstructure@0.13.1
	tap@1.0.1
	tempfile@3.15.0
	terminal_size@0.4.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.9
	thiserror@1.0.69
	thiserror@2.0.9
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tiny-keccak@2.0.2
	tinystr@0.7.6
	tinystr@0.8.0
	tinytemplate@1.2.1
	tinyvec@1.8.1
	tinyvec_macros@0.1.1
	tokio-macros@2.4.0
	tokio-native-tls@0.3.1
	tokio-socks@0.5.2
	tokio-stream@0.1.17
	tokio-util@0.7.13
	tokio@1.42.0
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.5.2
	tracing-appender@0.2.3
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-journald@0.3.1
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing-test-macro@0.2.5
	tracing-test@0.2.5
	tracing@0.1.41
	try-lock@0.2.5
	trycmd@0.15.8
	typed-index-collections@3.1.0
	typeid@1.0.2
	typenum@1.17.0
	typetag-impl@0.2.19
	typetag@0.2.19
	uncased@0.9.10
	unicode-ident@1.0.14
	unicode-segmentation@1.12.0
	unicode-width@0.2.0
	unicode-xid@0.2.6
	untrusted@0.7.1
	untrusted@0.9.0
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	uuid@1.11.0
	valuable@0.1.0
	value-bag@1.10.0
	vcpkg@0.2.15
	version_check@0.9.5
	visibility@0.1.1
	visible@0.0.1
	void@1.0.2
	wait-timeout@0.2.0
	waker-fn@1.2.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasix@0.12.21
	wasm-bindgen-backend@0.2.99
	wasm-bindgen-futures@0.4.49
	wasm-bindgen-macro-support@0.2.99
	wasm-bindgen-macro@0.2.99
	wasm-bindgen-shared@0.2.99
	wasm-bindgen@0.2.99
	weak-table@0.3.2
	web-sys@0.3.76
	wide@0.7.31
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.58.0
	windows-implement@0.58.0
	windows-interface@0.58.0
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.58.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.6.22
	write16@1.0.0
	writeable@0.5.5
	wyz@0.5.1
	x25519-dalek@2.0.1
	x509-signature@0.5.0
	xxhash-rust@0.8.15
	xz2@0.1.7
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zerofrom-derive@0.1.5
	zerofrom@0.1.5
	zeroize@1.8.1
	zeroize_derive@1.4.2
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zstd-safe@7.2.1
	zstd-sys@2.0.13+zstd.1.5.6
	zstd@0.13.2
"

inherit cargo

MY_P="${PN}-${PN}-v${PV}"

DESCRIPTION="An implementation of Tor, in Rust."
HOMEPAGE="https://gitlab.torproject.org/tpo/core/arti/"

if [[ "${PV}" == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://gitlab.torproject.org/tpo/core/arti"
else
	SRC_URI="https://gitlab.torproject.org/tpo/core/${PN}/-/archive/${PN}-v${PV}/${PN}-${PN}-v${PV}.tar.bz2 -> ${P}.tar.bz2
		${CARGO_CRATE_URIS}"
	KEYWORDS="~amd64"
	S="${WORKDIR}/${MY_P}"
fi

LICENSE="MIT Apache-2.0"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unicode-3.0
	Unlicense ZLIB
"
SLOT="0"

DEPEND="app-arch/xz-utils
	app-arch/zstd:=
	dev-db/sqlite:3
	dev-libs/openssl:="
RDEPEND="${DEPEND}"

QA_FLAGS_IGNORED="usr/bin/arti"

src_unpack() {
	if [[ "${PV}" == *9999 ]]; then
		git-r3_src_unpack
		cargo_live_src_unpack
	else
		cargo_src_unpack
	fi
}

src_compile() {
	export ZSTD_SYS_USE_PKG_CONFIG=1
	for crate in crates/*; do
		pushd "${crate}" || die
		cargo_src_compile
		popd >/dev/null || die
	done
}

src_install() {
	pushd crates/arti >/dev/null || die

	cargo_src_install
	newdoc src/arti-example-config.toml arti.toml

	popd >/dev/null || die

	dodoc -r doc/*
}
