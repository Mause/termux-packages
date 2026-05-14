#!/bin/bash
TERMUX_PKG_HOMEPAGE='https://github.com/oven-sh/bun'
TERMUX_PKG_DESCRIPTION='Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one'
TERMUX_PKG_LICENSE='NAUMEN'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.3.14'
TERMUX_PKG_SRCURL=https://github.com/oven-sh/bun/archive/refs/tags/bun-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='112a5915992807f04b183854d360c2bf87ac7c1587fb5da3c560bdbb75b8c92e'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="llvm"
TERMUX_ZIG_VERSION="0.15.2"

set -o xtrace

termux_step_pre_configure() {
	termux_setup_zig
	termux_setup_rust
	termux_setup_cmake
	termux_setup_ninja
	curl -fsSL https://bun.sh/install | bash  # need a host version of bun as well

	export TERMUX_STANDALONE_TOOLCHAIN
	export TERMUX_ARCH
}

termux_step_configure() {
	:
}

termux_step_make() {
	~/.bun/bin/bun build:ci
}
