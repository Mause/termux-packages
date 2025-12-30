TERMUX_PKG_HOMEPAGE='https://github.com/Automattic/harper'
TERMUX_PKG_DESCRIPTION='Offline, privacy-first grammar checker. Fast, open-source, Rust-powered'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.3.0'
TERMUX_PKG_SRCURL=https://github.com/Automattic/harper/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='ccc408a4f9124cacfdb76bbf9aa42a5950b2cc6acebadca9c8dd0f02c70f4104'
TERMUX_PKG_EXTRA_CONFIGURE_ARGS='--path harper-ls'

termux_step_pre_configure() {
	termux_setup_rust
}
