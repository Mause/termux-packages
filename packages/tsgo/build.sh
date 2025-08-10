TERMUX_PKG_DESCRIPTION="A port of the typescript compiler to go"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_VERSION="0.1.0"
TERMUX_PKG_HOMEPAGE="https://github.com/microsoft/typescript-go"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_SRCURL="git+https://github.com/microsoft/typescript-go"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_golang
	termux_setup_nodejs

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	npm install
	./node_modules/.bin/hereby build --release --target "$(go env GOOS)-$(go env GOARCH)" --outdir "$TERMUX_PKG_SRCDIR"
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_SRCDIR/built/local/tsgo" -t "$TERMUX_PREFIX/bin"
	ls "$TERMUX_PKG_SRCDIR/built/local"
	install -Dm644 "$TERMUX_PKG_SRCDIR/built/local/*.d.ts" -t "$TERMUX_PREFIX/share/tsgo"
}
