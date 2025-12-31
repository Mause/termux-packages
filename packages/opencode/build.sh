TERMUX_PKG_HOMEPAGE='https://github.com/sst/opencode'
TERMUX_PKG_DESCRIPTION='The open source coding agent.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.0.219'
TERMUX_PKG_SRCURL=https://github.com/sst/opencode/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='2ec05c65e06947df238bf534c53a0b2a72e23d6303883fdb242263d5c9935a79'

termux_step_make() {
	curl -fsSL https://bun.com/install | bash
	export PATH="$HOME/.bun/bin:$PATH"

	bun install
	./packages/opencode/script/build.ts --single
}
