TERMUX_PKG_DESCRIPTION="A port of the typescript compiler to go"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_HOMEPAGE="https://github.com/microsoft/typescript"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_HOMEPAGE='https://github.com/microsoft/typescript'
TERMUX_PKG_VERSION='7.1-beta'
TERMUX_PKG_GIT_BRANCH="typescript/v${TERMUX_PKG_VERSION}"
TERMUX_PKG_SRCURL=git+https://github.com/microsoft/typescript
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='feb3406fbe4f3ffe8887d83dbce20e789ab0eee0ec26a806ad306504fc828487'

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
