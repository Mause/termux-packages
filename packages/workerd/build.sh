TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="The JavaScript / Wasm runtime that powers Cloudflare Workers"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workerd"
TERMUX_PKG_VERSION="1.20260329.1"
TERMUX_PKG_GIT_BRANCH="v$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workerd"
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_SHA256=5aa1f62a5db416f7aa816d3aa30dd1a174df967364236f599c892a4b72f83a90
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXCLUDED_ARCHES="arm, i686"

set -o xtrace

termux_step_pre_configure() {
	termux_setup_nodejs
	wget https://github.com/bazelbuild/bazelisk/releases/download/v1.28.1/bazelisk-linux-amd64
	chmod +x bazelisk-linux-amd64
	./bazelisk-linux-amd64 version
}

termux_step_make() {
	export ANDROID_NDK_HOME="$NDK"
	./bazelisk-linux-amd64 build //src/workerd/server:workerd --platforms=//:android-arm64 --extra_toolchains=@androidndk//all
}
