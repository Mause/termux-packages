TERMUX_PKG_HOMEPAGE='https://github.com/zizmorcore/zizmor'
TERMUX_PKG_DESCRIPTION='Static analysis for GitHub Actions'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.30.1'
TERMUX_PKG_SRCURL=https://github.com/zizmorcore/zizmor/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='3224fd5b49b77b2ec1a8a0809587824e3bc346a7583e8272d8ad66f95d0e8cc2'
TERMUX_PKG_DEPENDS="openssl"

termux_step_post_get_source() {
	rm pyproject.toml Makefile
}

termux_step_pre_configure() {
	termux_setup_cmake
	termux_setup_rust

	cargo install patch-crate --locked
	cargo patch-crate

	TERMUX_PKG_SRCDIR+=/crates/zizmor
	TERMUX_PKG_BUILDDIR=$TERMUX_PKG_SRCDIR
}
