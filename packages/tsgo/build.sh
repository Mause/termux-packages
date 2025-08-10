TERMUX_PKG_DESCRIPTION="A port of the typescript compiler to go"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.13.1"
TERMUX_PKG_SRCURL="https://github.com/microsoft/typescript-go.git"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_go

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	npm install --global hereby
	hereby build --release --target "$(go env GOOS)-$(go env GOARCH)" --outdir "$TERMUX_PKG_SRCDIR"
}

