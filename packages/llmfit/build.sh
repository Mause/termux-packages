TERMUX_PKG_HOMEPAGE='https://github.com/AlexsJones/llmfit.git'
TERMUX_PKG_DESCRIPTION='157 models. 30 providers. One command to find what runs on your hardware.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.3.1'
TERMUX_PKG_SRCURL=https://github.com/AlexsJones/llmfit/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='27682f8f9b0ed3fe34b2224ec64774ba54017a071171e76a2379e9b5c89aa207'

set -o xtrace

termux_step_pre_configure() {
	termux_setup_rust
}
