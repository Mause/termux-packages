TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="The JavaScript / Wasm runtime that powers Cloudflare Workers"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workerd"
TERMUX_PKG_VERSION="v1.20251009.0"
TERMUX_PKG_GIT_BRANCH="v$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workerd"
TERMUX_PKG_DEPENDS="python, bazel"
TERMUX_PKG_SHA256=0c0477663aaa85fcf2f798581529a9cdacdb14f5d093dd5b861a854c7b056e05
TERMUX_PKG_BUILD_IN_SRC=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_nodejs
}

termux_step_make() {
	bazel build //src/workerd/server:workerd
}
