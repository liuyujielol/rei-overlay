# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs
MY_PV="${PV//./-}"

DESCRIPTION="Small and embeddable JavaScript engine"
HOMEPAGE="https://bellard.org/quickjs"
SRC_URI="https://bellard.org/quickjs/quickjs-${MY_PV}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-${MY_PV}"

PATCHES=( "${FILESDIR}/${PN}-2020.03.27_Remove-TTY-check-in-test.patch" )

src_prepare() {
	sed -i \
		-e 's;prefix=/usr/local;prefix=/usr;' \
		-e '/$(STRIP) .*/d' \
		Makefile || die "Failed setting prefix"

	sed -Ei '/^\s*(CC|AR)=/d' Makefile \
		|| die "Failed to remove hard-coded tools."

	sed -Ei 's/(^\s*(C|LD)FLAGS)=/\1\+=/' Makefile \
		|| die "Failed to change build flag assignment into addition."

	tc-export CC AR

	default
}
