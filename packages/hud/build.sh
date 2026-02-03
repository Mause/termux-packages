TERMUX_PKG_HOMEPAGE='https://github.com/cong-or/hud'
TERMUX_PKG_DESCRIPTION='Find code blocking your Tokio workers. eBPF-powered, no instrumentation.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.4.1'
TERMUX_PKG_SRCURL=https://github.com/cong-or/hud/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='2439b46c10ee84d12f852d0c6fef5d1b5d36d99bcc987cae7ef9926a17e0c5bf'

termux_step_pre_configure() {
	termux_setup_rust
}
