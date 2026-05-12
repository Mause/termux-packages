TERMUX_PKG_HOMEPAGE='https://github.com/zizmorcore/zizmor'
TERMUX_PKG_DESCRIPTION='Static analysis for GitHub Actions'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.24.1'
TERMUX_PKG_SRCURL=https://github.com/zizmorcore/zizmor/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='4a037cd9ccdebdcf02e508f248c5ee8656ebf024d8f29d2c458498f16fe9893b'

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_post_get_source() {
	rm pyproject.toml
}
