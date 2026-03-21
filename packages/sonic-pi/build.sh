TERMUX_PKG_HOMEPAGE='https://github.com/samaaron/sonic-pi'
TERMUX_PKG_DESCRIPTION='Code. Music. Live.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='4.6.0'
TERMUX_PKG_SRCURL=https://github.com/samaaron/sonic-pi/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='364b037ab62015d75b8d8cefd99369c6936e1ebe8cece3db541ceac4622f06a5'

termux_step_pre_configure() {
	termux_setup_cmake
	cd "${TERMUX_PKG_SRCDIR}/app"
}
