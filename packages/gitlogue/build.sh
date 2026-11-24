TERMUX_PKG_HOMEPAGE='https://github.com/unhappychoice/gitlogue'
TERMUX_PKG_DESCRIPTION='A cinematic Git commit replay tool for the terminal, turning your Git history into a living, animated story.'
TERMUX_PKG_LICENSE='ISC'
TERMUX_PKG_MAINTAINER='@termux '
TERMUX_PKG_VERSION='0.9.0'
TERMUX_PKG_SRCURL=https://github.com/unhappychoice/gitlogue/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='e0e7c7def40757a41081b0e76daab0fd9f40af2840028b382e02728dcf3e9c8d'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="zlib"
TERMUX_PKG_EXCLUDED_ARCHES="i686"

termux_step_pre_configure() {
	termux_setup_rust
}
