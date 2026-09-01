#!/bin/bash
TERMUX_PKG_HOMEPAGE='https://github.com/oven-sh/bun'
TERMUX_PKG_DESCRIPTION='Incredibly fast JavaScript runtime, bundler, test runner, and package manager – all in one'
TERMUX_PKG_LICENSE='NAUMEN'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.0.1'
TERMUX_PKG_SRCURL=git+https://github.com/oven-sh/bun
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="llvm"
_COMMIT='19d8ade2c6c1f0eeae50bd9d7f2a4bf4a2551557'
TERMUX_PKG_GIT_BRANCH='main'

set -o xtrace

termux_step_post_get_source() {
	git fetch --unshallow
	git checkout $_COMMIT
}

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
