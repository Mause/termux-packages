TERMUX_PKG_HOMEPAGE='https://github.com/rapidfuzz/Levenshtein'
TERMUX_PKG_DESCRIPTION='The Levenshtein Python C extension module contains functions for fast computation of Levenshtein distance and string similarity'
TERMUX_PKG_LICENSE='NAUMEN'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.27.3'
TERMUX_PKG_SRCURL=https://github.com/rapidfuzz/Levenshtein/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='bc052cc7ac742b4a2dcfb82212b157f4adce9193ed27fe4d495f1349546eecdd'
TERMUX_PKG_DEPENDS='python'

termux_step_pre_configure() {
	termux_setup_python_pip
}
