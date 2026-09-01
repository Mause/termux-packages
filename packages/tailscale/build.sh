TERMUX_PKG_HOMEPAGE='https://github.com/tailscale/tailscale'
TERMUX_PKG_DESCRIPTION='The easiest, most secure way to use WireGuard and 2FA.'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.96.4'
TERMUX_PKG_SRCURL=git+https://github.com/tailscale/tailscale
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_golang
}

termux_step_make() {
	./build_dist.sh tailscale.com/cmd/tailscale
	./build_dist.sh tailscale.com/cmd/tailscaled
}
