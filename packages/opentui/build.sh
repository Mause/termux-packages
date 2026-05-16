TERMUX_PKG_HOMEPAGE='https://github.com/anomalyco/opentui'
TERMUX_PKG_DESCRIPTION='OpenTUI is a library for building terminal user interfaces (TUIs)'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.2.12'
TERMUX_PKG_SRCURL=https://github.com/anomalyco/opentui/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='774cee9adc88a233ee035d035461eb96c50364ef7ee0b3350107b7b3b020043b'

termux_step_pre_configure() {
	termux_setup_zig
}
