TERMUX_PKG_HOMEPAGE='https://github.com/mitmproxy/mitmproxy_rs'
TERMUX_PKG_DESCRIPTION='The Rust bits in mitmproxy. 🦀'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_LICENSE_FILES='../LICENSE'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.12.9'
TERMUX_PKG_SRCURL=https://github.com/mitmproxy/mitmproxy_rs/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='fc20e6f576ab6e5726754555dc96f7753e3580de233f4f911cfbf224bf6dd790'

termux_step_pre_configure() {
	termux_setup_rust
	TERMUX_PKG_SRCDIR+="/mitmproxy-rs"
	TERMUX_PKG_BUILDDIR+="/mitmproxy-rs"
}
