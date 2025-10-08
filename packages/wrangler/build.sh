TERMUX_PKG_LICENSE="MIT, Apache-2.0"
TERMUX_PKG_LICENSE_FILE="../../LICENSE-MIT, ../../LICENSE-APACHE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="CLI for building CloudFlare worker applications"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_VERSION="4.42.1"
TERMUX_PKG_GIT_BRANCH="wrangler@$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_SUBDIR="packages/wrangler"
TERMUX_PKG_DEPENDS="nodejs"
TERMUX_PKG_SHA256=0c0477663aaa85fcf2f798581529a9cdacdb14f5d093dd5b861a854c7b056e05
TERMUX_PKG_BUILD_IN_SRC=true

set -o xtrace

termux_step_post_get_source() {
	TERMUX_PKG_SRCDIR+="/packages/wrangler"
}

termux_step_pre_configure() {
	termux_setup_nodejs
	curl -fsSL https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
}

termux_step_make() {
	pwd
	cd $TERMUX_PKG_SRCDIR
	pwd
	source /home/builder/.bashrc
	ls
	npm run build
}

termux_step_make_install() {
	npm install
}
