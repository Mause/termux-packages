TERMUX_PKG_HOMEPAGE='https://github.com/anomalyco/opentui'
TERMUX_PKG_DESCRIPTION='OpenTUI is a library for building terminal user interfaces (TUIs)'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.4.0'
TERMUX_PKG_SRCURL=https://github.com/anomalyco/opentui/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='11165c41fe22241c62b6440bb016c28b0d119cffbb67e49a333c458242dd83b7'
TERMUX_ZIG_VERSION='0.15.2'

termux_step_pre_configure() {
	termux_setup_zig
	termux_setup_nodejs
}

termux_step_make() {
	curl -fsSL https://bun.com/install | bash
	export PATH="$HOME/.bun/bin:$PATH"
	cd packages/core
	bun install
	bun run scripts/build.ts --native --lib
	bun pm pack
}

termux_step_make_install() {
	install -Dm600 -t "${TERMUX_PREFIX}/lib" "${TERMUX_PKG_BUILDDIR}/packages/core/src/zig/lib/aarch64-linux-musl/libopentui.so"
	npm install -g ./packages/core/opentui-core-$TERMUX_PKG_VERSION.tgz
}
