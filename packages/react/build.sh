TERMUX_PKG_HOMEPAGE='https://react.dev/'
TERMUX_PKG_DESCRIPTION='The library for web and native user interfaces.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='19.2.7-dev'
TERMUX_PKG_SRCURL=git+https://github.com/react/react
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
_COMMIT='34b78a2897cc208260a88e6b62ecaf9ca2a9dfe4'
TERMUX_PKG_GIT_BRANCH='main'

termux_step_post_get_source() {
        git fetch --unshallow
        git checkout $_COMMIT
}
