TERMUX_PKG_HOMEPAGE='https://github.com/aws/aws-cli'
TERMUX_PKG_DESCRIPTION='Universal Command Line Interface for Amazon Web Services'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2.32.30'
TERMUX_PKG_SRCURL=https://github.com/aws/aws-cli/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='8318ec37c35b4cac817369a4d41740f54fa83c62611d84c65eb7204e77f7dd85'
TERMUX_PKG_DEPENDS='python, openssl, ‎aws-crt-python'
TERMUX_PKG_EXTRA_CONFIGURE_ARGS='--with-download-deps'

set -o xtrace

termux_step_pre_configure() {
	termux_setup_python_pip
	termux_setup_cmake
}

termux_step_make() {
	AWS_CRT_BUILD_USE_SYSTEM_LIBCRYPTO=1 \
	make
}
