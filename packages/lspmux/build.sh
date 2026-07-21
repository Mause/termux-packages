TERMUX_PKG_HOMEPAGE='https://codeberg.org/p2502/lspmux'
TERMUX_PKG_DESCRIPTION='share one language server instance between multiple LSP clients to save resources'
TERMUX_PKG_LICENSE='EUPL-1.2'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.3.0'
TERMUX_PKG_SRCURL=https://codeberg.org/p2502/lspmux/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='92410dfcda4429e0463db91b67712da00fda5fa9fb5316174126e702eb988440'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SERVICE_SCRIPT=("lspmux" "${TERMUX_PREFIX}/bin/lspmux server")

termux_step_pre_configure() {
	termux_setup_rust
}
