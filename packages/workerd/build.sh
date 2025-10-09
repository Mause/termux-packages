TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="The JavaScript / Wasm runtime that powers Cloudflare Workers"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workerd"
TERMUX_PKG_VERSION="1.20251009.0"
TERMUX_PKG_GIT_BRANCH="v$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workerd"
TERMUX_PKG_DEPENDS="python, bazel"
TERMUX_PKG_SHA256=59645fb25b84d11f108436e83d9df5e874ba4eb76ab62948869a23a3ee692fa7
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_EXCLUDED_ARCHES="arm, i686"

set -o xtrace

termux_step_pre_configure() {
	termux_setup_nodejs
}

termux_step_make() {
	ls $TERMUX_PREFIX/bin
	$TERMUX_PREFIX/bin/bazel build //src/workerd/server:workerd
}
