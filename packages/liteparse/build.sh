TERMUX_PKG_HOMEPAGE='https://github.com/run-llama/liteparse/tree/main/crates/liteparse'
TERMUX_PKG_DESCRIPTION='A fast, helpful, and open-source document parser'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2.0.4'
TERMUX_PKG_SRCURL=https://github.com/run-llama/liteparse/archive/refs/tags/crates-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='33c65f535b68a41fd1512511b1ddebed17c194eaf08df5c207e4edb1d6b83fe9'

set -o xtrace

termux_step_pre_configure() {
	termux_setup_rust
	TERMUX_PKG_SRCDIR+="/crates/liteparse"
	TERMUX_PKG_BUILDDIR="$TERMUX_PKG_SRCDIR"

	wget https://github.com/bblanchon/pdfium-binaries/releases/latest/download/pdfium-android-arm64.tgz
	tar -vxzf pdfium-android-arm64.tgz
	PDFIUM_LIB_PATH="$(find . -name "libpdfium.so")"
}
