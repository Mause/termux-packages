TERMUX_PKG_DESCRIPTION="Git Town solves the problem that using the Git CLI correctly."
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="21.5.0"
TERMUX_PKG_HOMEPAGE="https://www.git-town.com"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE"
TERMUX_PKG_SRCURL="https://github.com/git-town/git-town/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_SHA256="790e40a667019ee4497debb749b07f64d72a656c9569f640b24331ae8a685d01"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_golang
}

termux_step_make() {
	go get

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
