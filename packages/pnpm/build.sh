TERMUX_PKG_HOMEPAGE='https://pnpm.io/'
TERMUX_PKG_DESCRIPTION='Fast, disk space efficient package manager'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='12.3.4'
TERMUX_PKG_SRCURL=https://github.com/pnpm/pnpm/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='4f400669b36259278efe44278e4adfc7f449fbccb4c255670c66332a7a792aa1'

termux_step_pre_configure() {
	termux_setup_rust
}
