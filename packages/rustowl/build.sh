TERMUX_PKG_HOMEPAGE='https://github.com/cordx56/rustowl'
TERMUX_PKG_DESCRIPTION='Visualize Ownership and Lifetimes in Rust'
TERMUX_PKG_LICENSE='MPL-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.3.4'
TERMUX_PKG_SRCURL=https://github.com/cordx56/rustowl/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='fa120643aeb48061eb32a7c993dabff88aa4e9d0b32f8ab0f3289b3fb2cf5744'
TERMUX_PKG_BUILD_IN_SRC='true'
TERMUX_PKG_AUTO_UPDATE='true'

termux_step_pre_configure() {
	termux_setup_rust
	. ~/.cargo/env
	rustup component add rust-src rustc-dev llvm-tools-preview --target $CARGO_TARGET_NAME
}
