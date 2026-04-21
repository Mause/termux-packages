TERMUX_PKG_HOMEPAGE='https://github.com/oxc-project/tsgolint'
TERMUX_PKG_DESCRIPTION='Type aware linting for oxlint'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.21.1'
TERMUX_PKG_SRCURL=https://github.com/oxc-project/tsgolint/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9dfb551e64b1e6e0fce7d7ba48f02b558be310b1b6a45904f9edc63607071378'

termux_step_pre_configure() {
	termux_setup_golang
}
