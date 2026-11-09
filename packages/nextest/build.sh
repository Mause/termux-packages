TERMUX_PKG_HOMEPAGE='https://github.com/nextest-rs/nextest'
TERMUX_PKG_DESCRIPTION='A next-generation test runner for Rust.'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.9.126'
TERMUX_PKG_SRCURL=https://github.com/nextest-rs/nextest/archive/refs/tags/cargo-nextest-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='f6f1af7270e7a3f4e82dfd903f625dd4f1b278c601e7e6d470585e7e46e904cc'

termux_step_pre_configure() {
	termux_setup_rust
}
