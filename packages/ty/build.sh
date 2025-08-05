TERMUX_PKG_HOMEPAGE=https://docs.astral.sh/ty/
TERMUX_PKG_DESCRIPTION="An extremely fast Python typechecker, written in Rust."
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_LICENSE_FILE="../../../LICENSE"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.0.1-alpha.28"
TERMUX_PKG_SRCURL=https://github.com/astral-sh/ty/releases/download/${TERMUX_PKG_VERSION}/source.tar.gz
TERMUX_PKG_SHA256=fa4a602a0ade44dd8a5a7671ed1ae5bf76c724eeba22a95e6137dc99a9602a57
TERMUX_PKG_DEPENDS="zstd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_PYTHON_COMMON_DEPS="wheel, maturin"

termux_step_post_get_source() {
	TERMUX_PKG_SRCDIR+="/ruff/crates/ty"

	local file="$TERMUX_PKG_CACHEDIR/$(basename "${TERMUX_PKG_SRCURL}")"
	mkdir -p "$TERMUX_PKG_SRCDIR"
	tar xf "$file" -C "$TERMUX_PKG_SRCDIR" --strip-components=0
}

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_python_pip

	# Dummy CMake toolchain file to workaround build error:
	# error: failed to run custom build command for `libz-ng-sys v1.1.15`
	# ...
	# CMake Error at /home/builder/.termux-build/_cache/cmake-3.28.3/share/cmake-3.28/Modules/Platform/Android-Determine.cmake:217 (message):
	# Android: Neither the NDK or a standalone toolchain was found.
	export TARGET_CMAKE_TOOLCHAIN_FILE="${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"
	touch "${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME
}

termux_step_make() {
	rustc --version
	cargo --version
	ls
	maturin build --locked --release --all-features --target "$CARGO_TARGET_NAME" --strip --verbose
}

termux_step_make_install() {
	pip install . --no-deps --prefix=$TERMUX_PREFIX
}
