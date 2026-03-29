TERMUX_PKG_LICENSE="MIT, Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE-MIT, LICENSE-APACHE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="CLI for building CloudFlare worker applications"
TERMUX_PKG_HOMEPAGE="https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_VERSION="4.78.0"
TERMUX_PKG_GIT_BRANCH="wrangler@$TERMUX_PKG_VERSION"
TERMUX_PKG_SRCURL="git+https://github.com/cloudflare/workers-sdk"
TERMUX_PKG_DEPENDS="nodejs"
TERMUX_PKG_SHA256=72083d88ce6d7031994539daa86a17d0c2866c5e2ba4bd66f08d8e32e5a40200
TERMUX_PKG_BUILD_IN_SRC=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_nodejs
	curl -fsSL https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -
}

termux_step_make() {
	pwd
	export PNPM_HOME="/home/builder/.local/share/pnpm"
	export PATH="$PNPM_HOME:$PATH"
	ls
	pnpm install
	pnpm build --filter wrangler
}

termux_step_make_install() {
	pwd
	ls
	ls $TERMUX_PKG_SRCDIR/packages/wrangler/wrangler-dist
	mkdir -p $TERMUX_PREFIX/lib/node_modules/wrangler/
	mkdir -p $TERMUX_PREFIX/lib/node_modules/wrangler/node_modules/
	find $TERMUX_PKG_SRCDIR/packages/wrangler/wrangler-dist -type f -exec install -m 600 "{}" $TERMUX_PREFIX/lib/node_modules/wrangler/ -v  \;
	cp -r $TERMUX_PKG_SRCDIR/node_modules $TERMUX_PREFIX/lib/node_modules/wrangler
}
