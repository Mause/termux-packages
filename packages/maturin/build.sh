TERMUX_PKG_HOMEPAGE='https://github.com/PyO3/maturin'
TERMUX_PKG_DESCRIPTION='Build and publish crates with pyo3, cffi and uniffi bindings as well as rust binaries as python packages'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.14.1'
TERMUX_PKG_SRCURL=https://github.com/PyO3/maturin/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='435f8d5b267e52588fe699cab97a8234e3d98977a9f9e6efe873e04f7f85f92c'

termux_step_configure() {
	termux_setup_rust
	export CARGO_BUILD_TARGET="${CARGO_TARGET_NAME}"
	export PYO3_CROSS_LIB_DIR="${TERMUX_PREFIX}/lib"
	export ANDROID_API_LEVEL="${TERMUX_PKG_API_LEVEL}"
}
