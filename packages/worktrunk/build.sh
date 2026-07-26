TERMUX_PKG_HOMEPAGE='https://worktrunk.dev/'
TERMUX_PKG_DESCRIPTION='Worktrunk is a CLI for Git worktree management, designed for parallel AI agent workflows'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.69.2'
TERMUX_PKG_SRCURL=https://github.com/max-sixty/worktrunk/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='984936d68f7a47afabc8670c2f7433da2f41b4815032ab472d6ced67993c35d4'

termux_step_pre_configure() {
	termux_setup_rust
}
