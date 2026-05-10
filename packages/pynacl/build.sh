TERMUX_PKG_HOMEPAGE='https://github.com/pyca/pynacl'
TERMUX_PKG_DESCRIPTION='Python binding to the Networking and Cryptography (NaCl) library'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.6.2'
TERMUX_PKG_SRCURL=https://github.com/pyca/pynacl/archive/refs/tags/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='fa489623e2a802c1c7e2127188e3072f326c229dbe23f99994b3547407a85958'
TERMUX_PKG_DEPENDS="python, python-pip, libsodium"
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_PYTHON_CROSS_BUILD_DEPS="'cffi>=1.12'"
TERMUX_PKG_PYTHON_TARGET_DEPS="'cffi>=1.12'"

termux_step_pre_configure() {
	termux_setup_python_pip
	export SODIUM_INSTALL=system
}
