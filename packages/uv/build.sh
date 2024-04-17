TERMUX_PKG_DESCRIPTION="An extremely fast Python package installer and resolver, written in Rust."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.1.32"
TERMUX_PKG_DEPENDS="python"
TERMUX_PKG_BUILD_DEPENDS="python-pip, rust"
TERMUX_PKG_HOMEPAGE="https://pypi.org/project/uv/"
TERMUX_PKG_SHA256="339a275711f2c1faab155f47c2e06e272292401ab054ede37d92ef7ebbffad9b"
TERMUX_PKG_SRCURL="https://files.pythonhosted.org/packages/57/94/97d0f47c8dbc1c0f6fbfaa3b39d3686220b2199a762735d364d5ba942031/uv-${TERMUX_PKG_VERSION}.tar.gz"
TERMUX_PKG_PYTHON_COMMON_DEPS="maturin"
TERMUX_PKG_SETUP_PYTHON=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_pre_configure() {
	termux_setup_rust
        termux_setup_cmake
}

termux_step_make_install() {
        maturin build --release --target $TERMUX_HOST_PLATFORM --manifest-path "$TERMUX_PKG_SRCDIR/Cargo.toml"
	pip3 -v install --no-build-isolation --no-deps --prefix "$TERMUX_PREFIX" "$TERMUX_PKG_SRCDIR"
}
