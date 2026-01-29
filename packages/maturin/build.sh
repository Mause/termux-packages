TERMUX_PKG_HOMEPAGE='https://github.com/PyO3/maturin'
TERMUX_PKG_DESCRIPTION='Build and publish crates with pyo3, cffi and uniffi bindings as well as rust binaries as python packages'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.11.5'
TERMUX_PKG_SRCURL=https://github.com/PyO3/maturin/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='4edf379859d0126ed860c1f1905da304ce4aea37f3ad58ede294a3920cb9e3aa'

termux_step_pre_configure() {
	termux_setup_rust
}
