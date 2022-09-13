# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )
PYTHON_REQ_USE="tk"
inherit toolchain-funcs python-single-r1 cmake xdg

DESCRIPTION="Extensible open-source framework for discrete numerical models"
HOMEPAGE="https://yade-dem.org/"

if [[ ${PV} = *9999* ]] ; then
	inherit git-r3
	MY_PV="999999"
	EGIT_REPO_URI="https://gitlab.com/yade-dev/trunk.git"
	# SUBMODULE 'data' contains only screenshots
	EGIT_SUBMODULES=()
	S="${WORKDIR}/yade-${MY_PV}"
else
	MY_PV="${PV:0:4}.${PV:4:2}a"
	SRC_URI="https://launchpad.net/yade/trunk/yade-1.00.0/+download/yade_${MY_PV}.tar.bz2"
	S="${WORKDIR}/trunk-${MY_PV}"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
IUSE="asan +cgal +cholmodgpu +complexmp cuda deform femlike +gl2ps +gts +gui +lbmflow +linsolv
	liqmigration +logger +lsdem maskaebitrary mpfr mpi oar +openmp partialsat +pfvflow
	+potentialblocks +potentialparticles profiling realhp sph +thermal +twophaseflow vectorize vtk
"

RDEPEND="
	dev-python/numpy
	dev-python/ipython
	dev-python/sphinx
	dev-python/matplotlib
	dev-python/pygraphviz
	dev-python/python-xlib
	dev-python/future
	realhp? ( dev-python/mpmath )

	>=dev-cpp/eigen-3.2.1:3[cuda?]
	>=dev-libs/boost-1.47[python]
	cgal? ( sci-mathematics/cgal )
	complexmp? ( >=dev-libs/boost-1.71[python] )
	cholmodgpu? ( sci-libs/cholmod[cuda?] )
	gui? (
		dev-python/PyQt5[webkit]
		dev-qt/qtwebkit:5
		dev-qt/qtwidgets:5
		dev-qt/qtxml:5
		dev-qt/qtopengl:5
	)
	gts? ( sci-libs/gts )
	media-libs/freeglut
	mpfr? (
		dev-libs/mpfr
		dev-libs/mpc
	)
	mpi? (
		dev-python/mpi4py
		sys-cluster/openmpi[cuda?]
	)
	linsolv? ( sci-libs/metis )

	sci-libs/coinor-clp
	sci-libs/openblas
	sys-devel/gdb
	x11-libs/gl2ps
	x11-libs/libQGLViewer

	dev-db/sqlite:3
	vtk? (
		sci-libs/vtk[imaging,rendering,cuda?]
	)
	${PYTHON_DEPS}
"
BDEPEND=""
REQUIRED_USE="
	${PYTHON_REQUIRED_USE}
"

PATCHES=(
	"${FILESDIR}/fix-202201a-cmake-find-python_3_10.patch"
)

pkg_setup() {
	if ! tc-is-gcc; then
		die "compilers other than gcc/g++ will not work; you need g++>=4.2 for openMP support"
	fi
	python_setup
}

src_prepare() {
	cmake_src_prepare
	# remove cmake symlink install
	sed -i '1351d' CMakeLists.txt || die
}

src_configure() {
	einfo "PYTHON_EXECUTABLE: ${PYTHON}"
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DruntimePREFIX=/usr
		-DSUFFIX="-${PV}"
		-DFORCE_FREEGLUT_PATH=/usr/include
		-DOpenGL_GL_PREFERENCE=GLVND
		-DPYTHON_EXECUTABLE="${PYTHON}"
		-DYADE_VERSION="${MY_PV}"
		-DENABLE_ASAN=$(usex asan)
		-DENABLE_CGAL=$(usex cgal)
		-DCHOLMOD_GPU=$(usex cholmodgpu)
		-DENABLE_COMPLEX_MP=$(usex complexmp)
		-DENABLE_DEFORM=$(usex deform)
		-DENABLE_FEMLIKE=$(usex femlike)
		-DENABLE_GL2PS=$(usex gl2ps)
		-DENABLE_GTS=$(usex gts)
		-DENABLE_GUI=$(usex gui)
		-DENABLE_LBMFLOW=$(usex lbmflow)
		-DENABLE_LINSOLV=$(usex linsolv)
		-DENABLE_LIQMIGRATION=$(usex liqmigration)
		-DENABLE_LOGGER=$(usex logger)
		-DENABLE_LS_DEM=$(usex lsdem)
		-DENABLE_MASK_ARBITRARY=$(usex maskaebitrary)
		-DENABLE_MPFR=$(usex mpfr)
		-DENABLE_MPI=$(usex mpi)
		-DENABLE_OAR=$(usex oar)
		-DENABLE_OPENMP=$(usex openmp)
		-DENABLE_PARTIALSAT=$(usex partialsat)
		-DENABLE_PFVFLOW=$(usex pfvflow)
		-DENABLE_POTENTIAL_BLOCKS=$(usex potentialblocks)
		-DENABLE_POTENTIAL_PARTICLES=$(usex potentialparticles)
		-DENABLE_PROFILING=$(usex profiling)
		-DENABLE_REAL_HP=$(usex realhp)
		-DENABLE_SPH=$(usex sph)
		-DENABLE_THERMAL=$(usex thermal)
		-DENABLE_TWOPHASEFLOW=$(usex twophaseflow)
		-DVECTORIZE=$(usex vectorize)
		-DENABLE_VTK=$(usex vtk)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install

	dosym "${EPREFIX}/usr/bin/yade-${PV}" /usr/bin/yade-${PV}.py
}
