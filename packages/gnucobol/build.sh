TERMUX_PKG_HOMEPAGE=https://gnucobol.sourceforge.io/
TERMUX_PKG_DESCRIPTION="A free/libre COBOL compiler"
TERMUX_PKG_LICENSE="GPL-3.0, LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="3.2"
TERMUX_PKG_REVISION=1
TERMUX_PKG_SRCURL=https://ftp.gnu.org/gnu/gnucobol/gnucobol-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=3bb48af46ced4779facf41fdc2ee60e4ccb86eaa99d010b36685315df39c2ee2
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="json-c, libgmp, libvbisam, libxml2, ncurses"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
--without-db
--with-json=json-c
--with-vbisam
"

termux_step_pre_configure() {
	local lp64="$(( $TERMUX_ARCH_BITS / 32 - 1 ))"
	export COB_LI_IS_LL="${lp64}"
	export COB_32_BIT_LONG="$(( 1 - ${lp64} ))"
	export COB_HAS_64_BIT_POINTER="${lp64}"
}
