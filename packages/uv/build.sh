TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_DESCRIPTION="An extremely fast Python package installer and resolver, written in Rust."
TERMUX_PKG_VERSION="0.1.32"
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_HOMEPAGE="https://pypi.org/project/uv/"
TERMUX_PKG_SHA256="339a275711f2c1faab155f47c2e06e272292401ab054ede37d92ef7ebbffad9b"
TERMUX_PKG_SRCURL="https://files.pythonhosted.org/packages/57/94/97d0f47c8dbc1c0f6fbfaa3b39d3686220b2199a762735d364d5ba942031/uv-${TERMUX_PKG_VERSION}.tar.gz"

termux_step_make_install() {
	pip -v install --no-build-isolation --no-deps --prefix "$TERMUX_PREFIX" "$TERMUX_PKG_SRCDIR"
}
