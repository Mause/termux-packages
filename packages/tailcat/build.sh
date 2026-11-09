TERMUX_PKG_HOMEPAGE='https://tailscale.com/tailcat'
TERMUX_PKG_DESCRIPTION="like netcat, but over Tailscale's data plane, without Tailscale's control plane"
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.4.0'
TERMUX_PKG_SRCURL=https://github.com/tailscale/tailcat/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='f3e87753aa45f8be249a2708a4220748fd8613f9ea0d0435a48ffedf8d724247'

set -o xtrace

termux_step_pre_configure() {
	termux_setup_golang
}

termux_step_make() {
	go build \
		-trimpath \
		-ldflags="-s -w" \
		-o tailcat \
		./cmd/tailcat
}

termux_step_make_install() {
	install -Dm755 tailcat "$TERMUX_PREFIX/bin/tailcat"
}
