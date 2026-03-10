TERMUX_PKG_HOMEPAGE='https://codeberg.org/forgejo-contrib/forgejo-cli'
TERMUX_PKG_DESCRIPTION='CLI application for interacting with Forgejo'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.4.0'
TERMUX_PKG_SRCURL=https://codeberg.org/forgejo-contrib/forgejo-cli/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='3dd84c58c8c5d5fc22b8456d9a4f35323e0386547743c6b24295a3dbc6a56fb7'

termux_step_pre_configure() {
	termux_setup_rust
}
