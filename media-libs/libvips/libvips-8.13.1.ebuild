# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

MY_PN="vips"

DESCRIPTION="A fast image processing library with low memory needs"
HOMEPAGE="https://libvips.github.io/libvips/"
SRC_URI="https://github.com/libvips/libvips/releases/download/v${PV}/${MY_PN}-${PV}.tar.gz"

LICENSE="LGPL-2.1"
# soname 42.15.1
SLOT="0/42.15.1"
KEYWORDS="~amd64 ~x86"

# External libraries
EXTERNAL_LIBRARIES=(
	+cfitsio +exif +fftw +fontconfig +gsf +heif +imagequant
	+jpeg jpeg-xl +lcms magick matio +openexr +openjpeg
	+orc +pangocairo +png poppler +rsvg +tiff +webp +zlib
)

# EXT_LIB supported by package BUT not available on gentoo (checked at 2022-09-22)
# EXTERNAL_LIBRARIES+=( cgif nifti openslide pdfium quantizr )

# cgif? ( media-libs/cgif::mva )
# nifti? ( media-libs/nifti::mva )
# openslide? ( media-libs/openslide::mva )
# use pdfium && die "no ebuilds to satisfy"
# use quantizr && die "no ebuilds satisfied"
# spng? ( media-libs/libspng::mva )

IUSE="+deprecated doxygen gtkdoc +modules +introspection
	+nsgif +ppm +analyze +radiance vapi
	${EXTERNAL_LIBRARIES[@]}
"

DEPEND="

	dev-libs/expat
	dev-libs/glib:2

	doxygen? ( app-doc/doxygen )
	gtkdoc? ( virtual/pandoc )

	cfitsio? ( sci-libs/cfitsio )

	exif? ( media-libs/libexif )
	fftw? ( >=sci-libs/fftw-3.3:3.0= )
	fontconfig? ( media-libs/fontconfig:1.0 )
	gsf? ( gnome-extra/libgsf )
	heif? ( media-libs/libheif )
	imagequant? ( media-gfx/libimagequant )
	jpeg? ( media-libs/libjpeg-turbo )
	jpeg-xl? ( media-libs/libjxl )
	lcms? ( media-libs/lcms:2 )
	magick? ( media-gfx/imagemagick )
	matio? ( sci-libs/matio )
	openexr? ( media-libs/openexr )
	openjpeg? ( media-libs/openjpeg:2 )
	orc? ( >=dev-lang/orc-0.4 )
	pangocairo? (
		x11-libs/pango
		x11-libs/cairo
	)
	png? ( media-libs/libpng )
	poppler? ( app-text/poppler )
	rsvg? ( gnome-base/librsvg:2 )
	tiff? ( media-libs/tiff )
	webp? ( media-libs/libwebp )
	zlib? ( sys-libs/zlib )
"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_configure() {
	local emesonargs=(
		# core
		$(meson_use deprecated)
		$(meson_use doxygen)
		$(meson_use gtkdoc gtk_doc)
		$(meson_feature modules)
		$(meson_use introspection)
		$(meson_use vapi)
		$(meson_use nsgif)
		$(meson_use ppm)
		$(meson_use analyze)
		$(meson_use radiance)
		# EXT_LIBs
		$(meson_feature cfitsio)
		#$(meson_feature cgif)
		$(meson_feature exif)
		$(meson_feature fftw)
		$(meson_feature fontconfig)
		$(meson_feature gsf)
		$(meson_feature heif)
		$(meson_feature imagequant)
		$(meson_feature jpeg-xl)
		$(meson_feature lcms)
		$(meson_feature magick)
		$(meson_feature matio)
		#$(meson_feature nifti)
		$(meson_feature openexr)
		$(meson_feature openjpeg)
		#$(meson_feature openslide)
		$(meson_feature orc)
		$(meson_feature pangocairo)
		#$(meson_feature pdfium)
		$(meson_feature png)
		$(meson_feature poppler)
		#$(meson_feature quantizr)
		$(meson_feature rsvg)
		#$(meson_feature spng)
		$(meson_feature tiff)
		$(meson_feature webp)
		$(meson_feature zlib)
	)

	meson_src_configure
}

src_test() {
	meson_src_test
}
