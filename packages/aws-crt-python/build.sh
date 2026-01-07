TERMUX_PKG_HOMEPAGE='https://github.com/awslabs/aws-crt-python'
TERMUX_PKG_DESCRIPTION='Python bindings for the AWS Common Runtime'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.31.0'
TERMUX_PKG_SRCURL=https://github.com/awslabs/aws-crt-python/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='b429ae666e6c1ab9aadb31e00c3556f1dcf363828cf1d04e63f8207f10b28096'

termux_step_pre_configure() {
	termux_setup_python_pip
}
