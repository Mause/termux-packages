TERMUX_PKG_HOMEPAGE=https://gmic.eu
TERMUX_PKG_DESCRIPTION="Full-featured framework for image processing"
TERMUX_PKG_LICENSE="CeCILL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="3.5.3"
TERMUX_PKG_SRCURL=https://gmic.eu/files/source/gmic_$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=e91a7cac4d0dc7c0ca2620f03bb14af82aa738c85a11b4f82fcc738654606442
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="fftw, imath, libc++, libcurl, libjpeg-turbo, libpng, libtiff, libx11, openexr, zlib"
TERMUX_PKG_BUILD_DEPENDS="graphicsmagick"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	return
}

termux_step_make() {
	cd src/
	make STRIP="$STRIP" OPT_CFLAGS="$CXXFLAGS" cli cli_gm
}

termux_step_make_install() {
	cp src/gmic $TERMUX_PREFIX/bin/
	cp src/gmic-gm $TERMUX_PREFIX/bin/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/
	cp man/gmic.1.gz $TERMUX_PREFIX/share/man/man1/gmic-gm.1.gz
}
