TERMUX_PKG_HOMEPAGE='https://github.com/pydantic/pydantic'
TERMUX_PKG_DESCRIPTION='Data validation using Python type hints'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2.12.5'
TERMUX_PKG_SRCURL=https://github.com/pydantic/pydantic/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='c79f06e47b8a49593a02ad0b3a0102089c4d22c55666183614dbbad33c12ae73'
TERMUX_PKG_DEPENDS='python, python-pydantic-core'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	:
}

termux_step_make_install() {
	pip install --prefix=$TERMUX_PREFIX .
}
