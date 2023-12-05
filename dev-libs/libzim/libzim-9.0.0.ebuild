# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit meson

DESCRIPTION="Reference implementation of the ZIM specification"
HOMEPAGE="
	https://download.openzim.org/release/libzim/
	https://github.com/openzim/libzim/
"
SRC_URI="https://download.openzim.org/release/libzim/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples +xapian"

DEPEND="
	xapian? ( dev-libs/xapian )
"
RDEPEND="${DEPEND}"

src_configure() {
	local emesonargs=(
		$(meson_use doc)
		$(meson_use examples)
		$(meson_use xapian with_xapian)
	)

	meson_src_configure
}
