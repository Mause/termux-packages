TERMUX_PKG_HOMEPAGE='https://github.com/dimonomid/nerdlog'
TERMUX_PKG_DESCRIPTION='Nerdlog: fast, remote-first, multi-host TUI log viewer with timeline histogram and no central server'
TERMUX_PKG_LICENSE='BSD 2-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.10.0'
TERMUX_PKG_SRCURL=https://github.com/dimonomid/nerdlog/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='95fb629044c5a74c2c541d4c39a9622674f15e59b98e6d1b025a47c218f69189'

termux_step_pre_configure() {
	termux_setup_golang
}
