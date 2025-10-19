TERMUX_PKG_HOMEPAGE='https://github.com/j178/prek'
TERMUX_PKG_DESCRIPTION='⚡ Better `pre-commit`, re-engineered in Rust'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.2.9'
TERMUX_PKG_SRCURL=https://github.com/j178/prek/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256='0fd25048c1498e3a54f7847fc6fc5119a6201c8c998f13d2743fd99795bac260'
TERMUX_PKG_BUILD_IN_SRC='true'
TERMUX_PKG_AUTO_UPDATE='true'
TERMUX_PKG_EXCLUDED_ARCHES="arm, i686"

termux_step_pre_configure() {
	termux_setup_rust
}

termux_step_make() {
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/prek
}

termux_step_create_debscripts() {
	cat <<-EOF >./postinst
		#!${TERMUX_PREFIX}/bin/sh

		prek generate-shell-completion bash > "${TERMUX_PREFIX}/share/bash-completion/completions/prek"
		prek generate-shell-completion elvish > "$TERMUX_PREFIX/share/elvish/lib/prek.elv"
		prek generate-shell-completion fish > "${TERMUX_PREFIX}/share/fish/vendor_completions.d/prek.fish"
		prek generate-shell-completion zsh > "${TERMUX_PREFIX}/share/zsh/site-functions/_prek"
	EOF
}
