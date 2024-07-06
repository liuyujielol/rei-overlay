# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_12 )

inherit distutils-r1

DESCRIPTION="Tool for converting Chinese characters to pinyin"
HOMEPAGE="
	https://pypi.org/project/pypinyin/
	https://github.com/mozillazg/python-pinyin/
"

# pypi tarballs are missing test data
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
PHARSE_PINYIN_DATA_COMMIT="2cdc1f69fc85ab243a36bcebf882a0747fe1994f"
PINYIN_DATA_COMMIT="889cde8bb0769747849f1d26bfc60c18efee1db3"
SRC_URI="
	https://github.com/mozillazg/python-pinyin/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz
	https://github.com/mozillazg/phrase-pinyin-data/archive/${PHARSE_PINYIN_DATA_COMMIT}.tar.gz\
	-> phrase-pinyin-data-${PHARSE_PINYIN_DATA_COMMIT}.gh.tar.gz
	https://github.com/mozillazg/pinyin-data/archive/${PINYIN_DATA_COMMIT}.tar.gz\
	-> pinyin-data-${PINYIN_DATA_COMMIT}.gh.tar.gz
"
S="${WORKDIR}/python-pinyin-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_sphinx docs
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare
	ln -sv "${WORKDIR}/phrase-pinyin-data-${PHARSE_PINYIN_DATA_COMMIT}/pinyin.txt" "${S}/phrase-pinyin-data/" || die
	ln -sv "${WORKDIR}/pinyin-data-${PINYIN_DATA_COMMIT}/pinyin.txt" "${S}/pinyin-data/" || die
	# for tests, remove coverage (pytest-cov)
	sed -i -e 's:--cov-report term-missing::' pytest.ini || die
}

src_compile() {
	emake gen_data
	distutils-r1_src_compile
}
