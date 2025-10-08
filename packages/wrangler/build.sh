TERMUX_PKG_LICENSE="MIT, Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="CLI for building CloudFlare worker applications"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_VERSION="4.42.1"
TERMUX_PKG_GIT_BRANCH="wrangler@$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_SUBDIR="packages/wrangler"
TERMUX_PKG_DEPENDS="nodejs"
TERMUX_PKG_SHA256=0c0477663aaa85fcf2f798581529a9cdacdb14f5d093dd5b861a854c7b056e05

termux_step_post_get_source() {
	TERMUX_PKG_SRCDIR+="/packages/wrangler"
}
