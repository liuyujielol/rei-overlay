# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..12} )

inherit cmake distutils-r1

DESCRIPTION="Conversion between Traditional and Simplified Chinese"
HOMEPAGE="https://github.com/BYVoid/OpenCC/"

SRC_URI="https://github.com/BYVoid/OpenCC/archive/refs/tags/ver.${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/OpenCC-ver.${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test +python"
RESTRICT="!test? ( test )"

BDEPEND="${PYTHON_DEPS}
	doc? ( app-doc/doxygen )"
DEPEND="dev-cpp/tclap
	dev-libs/darts
	dev-libs/marisa:0=
	dev-libs/rapidjson
	python? (
		dev-python/pybind11
	)
	test? (
		dev-cpp/gtest
		dev-cpp/benchmark
	)"
RDEPEND="dev-libs/marisa:0="

DOCS=(AUTHORS NEWS.md README.md)

src_prepare() {
	#rm -r deps || die

	cmake_src_prepare

	sed -e "s:\${DIR_SHARE_OPENCC}/doc:share/doc/${PF}:" -i doc/CMakeLists.txt || die

	use python && distutils-r1_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_DOCUMENTATION=$(usex doc ON OFF)
		-DBUILD_PYTHON=$(usex python)
		-DENABLE_BENCHMARK=$(if use test && has_version -d dev-cpp/benchmark; then echo ON; else echo OFF; fi)
		-DENABLE_GTEST=$(usex test ON OFF)
		-DUSE_SYSTEM_DARTS=ON
		-DUSE_SYSTEM_GOOGLE_BENCHMARK=ON
		-DUSE_SYSTEM_GTEST=ON
		-DUSE_SYSTEM_MARISA=ON
		-DUSE_SYSTEM_RAPIDJSON=ON
		-DUSE_SYSTEM_TCLAP=ON
		-DUSE_SYSTEM_PYBIND11=ON
	)

	cmake_src_configure

	use python && distutils-r1_src_configure
}

src_compile() {
	cmake_src_compile
	if use python; then
		ln -sv "${BUILD_DIR}/opencc_clib.*.so" python/opencc/clib/ || die
		distutils-r1_src_compile
	fi
}

python_test() {
	"${EPYTHON}" python/tests/test_opencc.py -v || die
}

src_test() {
	cmake_src_test
	use python && distutils-r1_src_test
}

src_install() {
	cmake_src_install
	use python && distutils-r1_src_install
}
