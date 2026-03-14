TERMUX_PKG_HOMEPAGE='https://github.com/voidzero-dev/vite-plus'
TERMUX_PKG_DESCRIPTION='Vite+ is the unified toolchain and entry point for web development. It manages your runtime, package manager, and frontend toolchain in one place.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.1.11'
TERMUX_PKG_SRCURL=https://github.com/voidzero-dev/vite-plus/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9542f8de994766b2d646566bb788b74a27d6d1f5cd9acb32f10e0a284403cfe1'

set -o xtrace

termux_step_post_get_source() {
	git clone https://github.com/vitejs/vite rolldown-vite
	pushd rolldown-vite; git checkout b565af6f1123a62b3058253b2147574b8515e89f; popd

	git clone https://github.com/rolldown/rolldown
	pushd rolldown; git checkout 00f9fa1d47335aacbb9becc527fd920169bdf0cf; popd
}

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_nodejs
}

termux_step_make() {
	corepack enable
	pnpm install
	pnpm run build
}
