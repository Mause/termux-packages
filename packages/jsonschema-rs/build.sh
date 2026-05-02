TERMUX_PKG_HOMEPAGE='https://github.com/Stranger6667/jsonschema-rs'
TERMUX_PKG_DESCRIPTION='A high-performance JSON Schema validator for Rust'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.45.0'
TERMUX_PKG_SRCURL=https://github.com/Stranger6667/jsonschema-rs/archive/refs/tags/rust-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='b46b13a469184964c7126b6a67a6bafdfd57bfbd2466a02013d7c968731c138e'

termux_step_pre_configure() {
	termux_setup_rust
	TERMUX_PKG_BUILDDIR+="/crates/jsonschema-cli"
	export TERMUX_PKG_BUILDDIR
}
