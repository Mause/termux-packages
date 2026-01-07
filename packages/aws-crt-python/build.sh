TERMUX_PKG_HOMEPAGE='https://github.com/awslabs/aws-crt-python'
TERMUX_PKG_DESCRIPTION='Python bindings for the AWS Common Runtime'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.31.0'
TERMUX_PKG_SRCURL=git+https://github.com/awslabs/aws-crt-python
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, openssl"

set -o xtrace

termux_step_pre_configure() {
	termux_setup_python_pip
	termux_setup_cmake
	export AWS_CRT_BUILD_USE_SYSTEM_LIBS=1
}
