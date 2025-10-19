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

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_PKG_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release
}

termux_step_make_install() {
	install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/prek
}
