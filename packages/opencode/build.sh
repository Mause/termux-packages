TERMUX_PKG_HOMEPAGE='https://github.com/sst/opencode'
TERMUX_PKG_DESCRIPTION='The open source coding agent.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.15.0'
TERMUX_PKG_SRCURL=https://github.com/sst/opencode/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9afbb063fdbd19d3a75dca9c5808783662a1401ce110416c7969cf4af1901111'

set -o xtrace

termux_step_make() {
	curl -fsSL https://bun.com/install | bash
	export PATH="$HOME/.bun/bin:$PATH"
	export OPENCODE_VERSION=$TERMUX_PKG_VERSION

	bun install

	./packages/opencode/script/build.ts --single --baseline

	# bun build --compile --target=bun-linux-arm64-musl --outdir=$TERMUX_PREFIX/bin
}
