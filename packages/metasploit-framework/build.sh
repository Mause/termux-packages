TERMUX_PKG_HOMEPAGE='https://github.com/rapid7/metasploit-framework/'
TERMUX_PKG_DESCRIPTION='Metasploit Framework'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='4.11.7'
TERMUX_PKG_SRCURL=https://github.com/rapid7/metasploit-framework/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='409600db0fb2903cb7f029a9fbddee984373e9cef7b451526bf79e7d3b2fba36'
TERMUX_PKG_DEPENDS='ruby, libpcap, postgresql, zlib, libsqlite'

termux_step_make() {
	$TERMUX_PREFIX/bin/bundler install --jobs 4 --retry 3
}
