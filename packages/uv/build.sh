TERMUX_PKG_DESCRIPTION="An extremely fast Python package installer and resolver, written in Rust."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.1.44"
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_DEPENDS="python-pip, rust"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_HOMEPAGE="https://pypi.org/project/uv/"
TERMUX_PKG_SHA256="d82c7338f8bcb0551672e759e4115c035246321059692416ee03ebe08629b913"
TERMUX_PKG_SRCURL="https://files.pythonhosted.org/packages/24/43/2aaa9798c8f3cdda524a2ac36018a22e6c9efd2456b2c03573410d6a1e0d/uv-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_PYTHON_COMMON_DEPS="maturin"
TERMUX_PKG_SETUP_PYTHON=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_cmake
	rustup target add aarch64-linux-android
}

termux_step_make() {
	maturin build --release --target $CARGO_TARGET_NAME --manifest-path "$TERMUX_PKG_SRCDIR/crates/uv/Cargo.toml" -vv
}

termux_step_make_install() {
	pip3 -v install --no-build-isolation --no-deps --prefix "$TERMUX_PREFIX" "$TERMUX_PKG_SRCDIR"
}
