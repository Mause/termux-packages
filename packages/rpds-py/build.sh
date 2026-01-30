TERMUX_PKG_HOMEPAGE='https://github.com/crate-py/rpds'
TERMUX_PKG_DESCRIPTION='Python bindings to the Rust rpds crate for persistent data structures'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.30.0'
TERMUX_PKG_SRCURL=https://github.com/crate-py/rpds/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='527f22aee8792edfceb4199a77347f32355b713c005d2e45c673705201448ad4'

termux_step_pre_configure() {
	termux_setup_rust
}
