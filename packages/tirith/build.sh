TERMUX_PKG_HOMEPAGE='https://github.com/sheeki03/tirith'
TERMUX_PKG_DESCRIPTION="Your browser catches homograph attacks. Your terminal doesn't. Tirith guards the gate — intercepts suspicious URLs, ANSI injection, and pipe-to-shell attacks before they execute."
TERMUX_PKG_LICENSE='GPL-3.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.1.5'
TERMUX_PKG_SRCURL=https://github.com/sheeki03/tirith/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='f19408483548ff353395ad7008e2c1747665930909d7179549663cbd8e859c85'

termux_step_pre_configure() {
	termux_setup_rust
}
