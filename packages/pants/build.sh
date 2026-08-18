TERMUX_PKG_HOMEPAGE='https://www.pantsbuild.org/'
TERMUX_PKG_DESCRIPTION='The Pants Build System'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2.33.0'
TERMUX_PKG_SRCURL=https://github.com/pantsbuild/pants/archive/refs/tags/release_${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS='python'
TERMUX_PKG_SHA256='b669fcf7bd63a375bd1c98d13d76b20214856397a11f247349e560fa65b328a9'

termux_step_pre_configure() {
	termux_setup_python_pip
	termux_setup_rust
}
