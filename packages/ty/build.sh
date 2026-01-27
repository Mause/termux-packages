TERMUX_PKG_HOMEPAGE=https://docs.astral.sh/ty/
TERMUX_PKG_DESCRIPTION="An extremely fast Python typechecker, written in Rust."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="../../LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.0.14"
TERMUX_PKG_SRCURL=https://github.com/astral-sh/ty/releases/download/${TERMUX_PKG_VERSION}/source.tar.gz
TERMUX_PKG_SHA256=1a28a8931f511c111f4284ca343e19abb3fc660be8cf796d9ca299d8b706a423
TERMUX_PKG_DEPENDS="zstd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_get_source() {
	TERMUX_PKG_SRCDIR+="/crates/ty"
}

termux_step_pre_configure() {
	termux_setup_rust

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	cd "$TERMUX_PKG_SRCDIR"

	PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig \
	PKG_CONFIG_ALL_DYNAMIC=1 \
	ZSTD_SYS_USE_PKG_CONFIG=1 \
	TY_VERSION="${TERMUX_PKG_VERSION}" \
	cargo build --jobs "${TERMUX_PKG_MAKE_PROCESSES}" --target "${CARGO_TARGET_NAME}" --release
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin target/"${CARGO_TARGET_NAME}"/release/ty
}

termux_step_post_make_install() {
	# Make a placeholder for shell-completions (to be filled with postinst)
	mkdir -p "${TERMUX_PREFIX}"/share/bash-completion/completions
	mkdir -p "${TERMUX_PREFIX}"/share/elvish/lib
	mkdir -p "${TERMUX_PREFIX}"/share/fish/vendor_completions.d
	mkdir -p "${TERMUX_PREFIX}"/share/zsh/site-functions
	touch "${TERMUX_PREFIX}"/share/bash-completion/completions/ty
	touch "${TERMUX_PREFIX}"/share/elvish/lib/ty.elv
	touch "${TERMUX_PREFIX}"/share/fish/vendor_completions.d/ty.fish
	touch "${TERMUX_PREFIX}"/share/zsh/site-functions/_ty
}

termux_step_create_debscripts() {
	cat <<-EOF >./postinst
		#!${TERMUX_PREFIX}/bin/sh

		ty generate-shell-completion bash > "${TERMUX_PREFIX}/share/bash-completion/completions/ty"
		ty generate-shell-completion elvish > "$TERMUX_PREFIX/share/elvish/lib/ty.elv"
		ty generate-shell-completion fish > "${TERMUX_PREFIX}/share/fish/vendor_completions.d/ty.fish"
		ty generate-shell-completion zsh > "${TERMUX_PREFIX}/share/zsh/site-functions/_ty"
	EOF
}
