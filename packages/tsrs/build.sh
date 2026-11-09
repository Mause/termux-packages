TERMUX_PKG_HOMEPAGE='https://www.npmjs.com/package/tsrs'
TERMUX_PKG_DESCRIPTION='Rust port of the TypeScript 7 type checker'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.18.0'
TERMUX_PKG_SRCURL=https://github.com/oxc-project/tsrs/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='d9a08890fb9b60442e4ae1a9a90b987daef7f3429afb2153cf8ebff635f7fcd6'

termux_step_pre_configure() {
	termux_setup_rust
}
