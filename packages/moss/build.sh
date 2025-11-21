TERMUX_PKG_HOMEPAGE='https://github.com/hexagonal-sun/moss'
TERMUX_PKG_DESCRIPTION='Rust Linux-compatible kernel'
TERMUX_PKG_LICENSE='Codehaus'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.0.1'
TERMUX_PKG_SRCURL=git+https://github.com/hexagonal-sun/moss
TERMUX_PKG_GIT_BRANCH=master
_COMMIT='fae19e3cba73d2ad65651167a76e92c9802853a3'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -x

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT
}

termux_step_pre_configure() {
	termux_setup_rust
}
