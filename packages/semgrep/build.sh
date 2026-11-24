TERMUX_PKG_HOMEPAGE='https://semgrep.dev/'
TERMUX_PKG_DESCRIPTION='Lightweight static analysis for many languages. Find bug variants with patterns that look like source code.'
TERMUX_PKG_LICENSE='LGPL-2.1-only'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.186.0'
TERMUX_PKG_SRCURL=https://github.com/semgrep/semgrep/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='4d643553b4944497a42d1b9a8f3d31debf7ca332289cdbff632d5a9f6bbd27dd'
TERMUX_PKG_DEPENDS='python'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
        termux_setup_python_pip
}
