TERMUX_PKG_HOMEPAGE='https://github.com/huseyinbabal/taws'
TERMUX_PKG_DESCRIPTION='Terminal UI for AWS (taws) - A terminal-based AWS resource viewer and manager'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.0.1'
TERMUX_PKG_SRCURL=https://github.com/huseyinbabal/taws/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='7f236db6eb9497c230ef4c67842f34664fa1e14a07501e99c9373243e25eee50'

termux_step_pre_configure() {
	termux_setup_rust
}
