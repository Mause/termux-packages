TERMUX_PKG_HOMEPAGE='https://github.com/huggingface/tokenizers'
TERMUX_PKG_DESCRIPTION='💥 Fast State-of-the-Art Tokenizers optimized for Research and Production'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.22.2'
TERMUX_PKG_SRCURL=https://github.com/huggingface/tokenizers/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_SHA256='05bffc70e12de04d4c060f9ecd404519aa069e93151c5642e7d731298d9273f6'

termux_step_pre_configure() {
	termux_setup_python_pip
	termux_setup_rust
	TERMUX_PKG_SRCDIR+="bindings/python"
}

termux_step_make() {
	cd $TERMUX_PKG_SRCDIR
	pip build .
}
