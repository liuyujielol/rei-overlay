# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{9..10} )
inherit distutils-r1

DESCRIPTION="A library to parse gdb mi output and interact with gdb subprocesses"
HOMEPAGE="https://github.com/cs01/pygdbmi"
SRC_URI="https://github.com/cs01/pygdbmi/archive/refs/tags/0.10.0.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="!test? ( test )"
