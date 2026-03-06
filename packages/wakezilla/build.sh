TERMUX_PKG_HOMEPAGE='https://github.com/guibeira/wakezilla'
TERMUX_PKG_DESCRIPTION='A simple Wake-on-LAN & reverse proxy toolkit — wake, route, and control your machines from anywhere. 🦖   '
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='7a29ed49ef967fe47ce8655d2f9bb74ec933d591'
TERMUX_PKG_SRCURL=https://github.com/guibeira/wakezilla/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='9e2a23225ed3abc0e8451fde501909bb8b4f09adf7daa5273e699483792b78c9'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}
