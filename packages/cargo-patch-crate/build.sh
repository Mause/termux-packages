TERMUX_PKG_HOMEPAGE='https://github.com/mokeyish/cargo-patch-crate'
TERMUX_PKG_DESCRIPTION='Fix broken crates instantly 🏃🏽\u200d♀️💨'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='dc063b222854f6474950f26d17e5ca09b9074c56'
TERMUX_PKG_SRCURL=https://github.com/mokeyish/cargo-patch-crate/archive/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='d626e01f31cceb4177195a392345a8b8631ac627c0f4e682b65a36e1e2ecdd47'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
}
