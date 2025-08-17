TERMUX_PKG_DESCRIPTION="Git Town solves the problem that using the Git CLI correctly."
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="21.4.3"
TERMUX_PKG_HOMEPAGE="https://www.git-town.com"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_SRCURL="https://github.com/git-town/git-town/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256="e94e3d1ffeec7251c914f3c6edbdf1d9e2bd89426184b4d14abb67caa0008dda"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

set -o xtrace

termux_step_pre_configure() {
	termux_setup_golang
}

termux_step_make() {
	go env GOPROXY
	go env -w GOPROXY=https://proxy.golang.org,direct
	go clean -modcache
	go mod init || :
	rm go.sum
	go mod tidy

	go build
}

termux_step_make_install() {
	install -Dm755 "$TERMUX_PKG_SRCDIR/git-town" -t "$TERMUX_PREFIX/bin"
}

termux_step_create_debscripts() {
	cat <<-EOF >./postinst
		#!${TERMUX_PREFIX}/bin/sh
		git-town completions bash > ${TERMUX_PREFIX}/share/bash-completion/completions/git-town.bash
		git-town completions zsh > ${TERMUX_PREFIX}/share/zsh/site-functions/_git-town
		git-town completions fish > ${TERMUX_PREFIX}/share/fish/vendor_completions.d/git-town.fish
	EOF
}
