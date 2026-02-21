TERMUX_PKG_HOMEPAGE='https://github.com/RightNow-AI/picolm'
TERMUX_PKG_DESCRIPTION='Run a 1-billion parameter LLM on a $10 board with 256MB RAM'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.0.1'
TERMUX_PKG_SRCURL=git+https://github.com/RightNow-AI/picolm
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
_COMMIT='20910bcd8694a470c5aebbb1df82434bc00794dc'
TERMUX_PKG_GIT_BRANCH='main'

set -o xtrace

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT
}

termux_step_make() {
	make native
	make model
}
