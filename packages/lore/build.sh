TERMUX_PKG_HOMEPAGE='https://lore.org/'
TERMUX_PKG_DESCRIPTION='Lore is a next-generation, open source version control system'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.8.3'
TERMUX_PKG_SRCURL=https://github.com/EpicGames/lore/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9973507858ccfa5d8e157b3bb058b29c811fd900fef34eef209db76af705d8d6'

termux_step_pre_configure() {
	termux_setup_rust
}
