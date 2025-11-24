TERMUX_PKG_HOMEPAGE='https://github.com/oven-sh/bun'
TERMUX_PKG_DESCRIPTION='Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one'
TERMUX_PKG_LICENSE='NAUMEN'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.3.3'
TERMUX_PKG_SRCURL=https://github.com/oven-sh/bun/archive/refs/tags/bun-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='f1325019737971e52e7077b468cd9e0b1fc8a392047a4d427b35ea544ff6c6b1'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="llvm"

set -o xtrace

termux_step_pre_configure() {
	termux_setup_zig
}

termux_step_make() {
	ZIG_TARGET_NAME=${TERMUX_ARCH}-linux-android
	zig build -Dtarget=$ZIG_TARGET_NAME
}
