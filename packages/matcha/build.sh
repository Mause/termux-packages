TERMUX_PKG_HOMEPAGE='https://github.com/piqoni/matcha'
TERMUX_PKG_DESCRIPTION='Daily Digest Reader'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.8.0'
TERMUX_PKG_SRCURL=https://github.com/piqoni/matcha/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='239f97bed3014c8809d3d70c7840b77985c7cd12dc73510ae7a2fe3f557a0e1d'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_golang
}

termux_step_make() {
	go build -v -ldflags "-X \"main.Version=$TERMUX_PKG_VERSION\""
}
