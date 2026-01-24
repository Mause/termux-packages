TERMUX_PKG_HOMEPAGE='https://github.com/tombi-toml/tombi'
TERMUX_PKG_DESCRIPTION='TOML Formatter / Linter / Language Server'
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION='0.6.10'
TERMUX_PKG_SRCURL=https://github.com/tombi-toml/tombi/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=7ac110a7a0e94804bfe250826839b2290b863546d6146e22ffc9cf83de080373
TERMUX_PKG_DEPENDS="zstd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_rust

	# Dummy CMake toolchain file to workaround build error:
	# error: failed to run custom build command for `libz-ng-sys v1.1.15`
	# ...
	# CMake Error at /home/builder/.termux-build/_cache/cmake-3.28.3/share/cmake-3.28/Modules/Platform/Android-Determine.cmake:217 (message):
	# Android: Neither the NDK or a standalone toolchain was found.
	export TARGET_CMAKE_TOOLCHAIN_FILE="${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"
	touch "${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	cd "$TERMUX_PKG_SRCDIR"

	TOMBI_VERSION=v$TERMUX_PKG_VERSION \
	cargo run --bin xtask -- set-version

	PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/" \
	PKG_CONFIG_ALL_DYNAMIC=1 \
	ZSTD_SYS_USE_PKG_CONFIG=1 \
	cargo build --jobs "${TERMUX_PKG_MAKE_PROCESSES}" --target "${CARGO_TARGET_NAME}" --release --verbose --bin tombi
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin target/"${CARGO_TARGET_NAME}"/release/tombi
}
