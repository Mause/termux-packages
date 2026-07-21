TERMUX_PKG_HOMEPAGE='https://github.com/wild-linker/wild'
TERMUX_PKG_DESCRIPTION='A very fast linker for Linux'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.9.0'
TERMUX_PKG_SRCURL=https://github.com/wild-linker/wild/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='f70ac025d158fd2c41be8f895a90a8f39b8b89fefbbb8ad5f45441f57b80156a'

termux_step_pre_configure() {
	termux_setup_rust
}
