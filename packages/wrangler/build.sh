TERMUX_PKG_LICENSE="MIT, Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT, LICENSE-APACHE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="CLI for building CloudFlare worker applications"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_VERSION="4.42.1"
TERMUX_PKG_GIT_BRANCH="wrangler@$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_DEPENDS="nodejs"
TERMUX_PKG_SHA256=0c0477663aaa85fcf2f798581529a9cdacdb14f5d093dd5b861a854c7b056e05

set -o xtrace

termux_step_pre_configure() {
	termux_setup_nodejs
}

termux_step_make_install() {
	npm install --global wrangler@$TERMUX_PKG_VERSION --prefix $TERMUX_PREFIX/lib/node_modules
}
