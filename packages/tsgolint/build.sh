TERMUX_PKG_HOMEPAGE='https://github.com/oxc-project/tsgolint'
TERMUX_PKG_DESCRIPTION='Type aware linting for oxlint'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.21.1'
TERMUX_PKG_SRCURL=git+https://github.com/oxc-project/tsgolint
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9dfb551e64b1e6e0fce7d7ba48f02b558be310b1b6a45904f9edc63607071378'
TERMUX_PKG_BUILD_DEPENDS="just, nodejs"

termux_step_pre_configure() {
	termux_setup_golang
	termux_setup_nodejs

	npm install -g corepack
	corepack enable

	git config --global user.email "you@example.com"
	git config --global user.name "Your Name"
	git submodule update --init

	pushd typescript-go
	git am --3way --no-gpg-sign ../patches/*.patch
	popd
	mkdir -p internal/collections && find ./typescript-go/internal/collections -type f ! -name '*_test.go' -exec cp {} internal/collections/ \;
	pnpm install
	cd e2e && pnpm install && cd ..
}

termux_step_make() {
	go build -o tsgolint ./cmd/tsgolint # -ldflags "-X 'main.version=$TERMUX_PKG_VERSION'"
}

termux_step_make_install() {
	rm "$TERMUX_PREFIX"/bin/yarn
	install -Dm700 -t "$TERMUX_PREFIX"/bin tsgolint
}
