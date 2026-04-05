TERMUX_PKG_HOMEPAGE='https://github.com/tailscale/tailscale'
TERMUX_PKG_DESCRIPTION='The easiest, most secure way to use WireGuard and 2FA.'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.96.4'
TERMUX_PKG_SRCURL=https://github.com/tailscale/tailscale/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='57b70731af7ae0ed167519924905fd032ddd8559a65bc8a3329d9da495f0feb2'

termux_step_pre_configure() {
	termux_setup_golang
}
