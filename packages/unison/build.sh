TERMUX_PKG_HOMEPAGE='https://github.com/unisonweb/unison'
TERMUX_PKG_DESCRIPTION='A friendly programming language from the future'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.0.0'
TERMUX_PKG_SRCURL=https://github.com/unisonweb/unison/archive/refs/tags/release/${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='2c0df99e84af3d5f2ef90a8c253dca5cb5ace2653345096e327f3b19d190f9c7'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_cabal
	termux_setup_ghc
	# curl -sSL https://get.haskellstack.org/ | sh
}
termux_step_make() {
	cabal --config="$TERMUX_CABAL_CONFIG" build unison-cli --project-file=contrib/cabal.project
	# stack --version # we'll want to know this version if you run into trouble
	# CFLAGS="-arch arm64 ${CFLAGS:-}" stack build --fast --test
	# stack exec unison
}
