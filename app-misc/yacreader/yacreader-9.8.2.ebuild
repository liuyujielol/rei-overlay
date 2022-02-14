# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Comic reader for cross-platform reading and managing your digital comic collection."
HOMEPAGE="https://www.yacreader.com/"
SRC_URI="https://github.com/YACReader/yacreader/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE="pdf qrcode extra-image-formats"

DEPEND="
	app-arch/unarr

"
RDEPEND="${DEPEND}"
BDEPEND=""
