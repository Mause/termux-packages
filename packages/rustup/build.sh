TERMUX_PKG_HOMEPAGE='https://github.com/rust-lang/rustup'
TERMUX_PKG_DESCRIPTION='The Rust toolchain installer'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.28.2'
TERMUX_PKG_SRCURL=https://github.com/rust-lang/rustup/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='5987dcb828068a4a5e29ba99ab26f2983ac0c6e2e4dc3e5b3a3c0fafb69abbc0'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}
