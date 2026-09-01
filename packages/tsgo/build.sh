TERMUX_PKG_DESCRIPTION="A port of the typescript compiler to go"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_HOMEPAGE="https://github.com/microsoft/typescript-go"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_HOMEPAGE='https://github.com/microsoft/typescript-go'
TERMUX_PKG_VERSION='7.0.2'
TERMUX_PKG_GIT_BRANCH="typescript/v${TERMUX_PKG_VERSION}"
TERMUX_PKG_SRCURL=git+https://github.com/microsoft/typescript-go
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='25cca8ec9d89e4ceec5181a677ded2c6d690fa18b81e1277846303973eb71fcf'

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_golang
	termux_setup_nodejs

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	npm install
	./node_modules/.bin/hereby native-preview:build-packages --for-release --target "$(go env GOOS)-$(go env GOARCH)"
	./node_modules/.bin/hereby native-preview:pack-packages --for-release --target "$(go env GOOS)-$(go env GOARCH)"
}

termux_step_make_install() {
	ls ./built/npm
	npm install -g ./built/npm/native-preview*.tgz
}
