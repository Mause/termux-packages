TERMUX_PKG_HOMEPAGE='https://github.com/ghostty-org/ghostty'
TERMUX_PKG_DESCRIPTION='👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.2.3'
TERMUX_PKG_SRCURL=https://github.com/ghostty-org/ghostty/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='e17d39482fc70fba3d72f5f25c12e9d9a72b87dd45a61a854d9928e98b69edd8'
TERMUX_PKG_BUILD_IN_SRC='true'
TERMUX_PKG_AUTO_UPDATE='true'
TERMUX_ZIG_VERSION=1.14.0

set -o xtrace

termux_step_make() {
	termux_setup_zig
	zig build -Dtarget="$ZIG_TARGET_NAME" -Doptimize=ReleaseSafe
}

termux_step_make_install() {
	install -Dm700 -t "$TERMUX_PREFIX/bin" zig-out/bin/zls
}
