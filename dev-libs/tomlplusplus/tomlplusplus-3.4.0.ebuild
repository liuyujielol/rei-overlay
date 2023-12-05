# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit cmake

DESCRIPTION="Header-only TOML config file parser and serializer for C++17"
HOMEPAGE="
	https://marzer.github.io/tomlplusplus
	https://github.com/marzer/tomlplusplus
"
SRC_URI="https://github.com/marzer/tomlplusplus/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
