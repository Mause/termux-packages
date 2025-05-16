TERMUX_PKG_HOMEPAGE=https://docs.astral.sh/ty/
TERMUX_PKG_DESCRIPTION="An extremely fast Python typechecker, written in Rust."
TERMUX_PKG_LICENSE="Apache-2.0, MIT"
TERMUX_PKG_LICENSE_FILE="LICENSE-APACHE, LICENSE-MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="0.0.1-alpha.1"
TERMUX_PKG_SRCURL=git+https://github.com/astral-sh/ty
TERMUX_PKG_GIT_BRANCH=$TERMUX_PKG_VERSION
TERMUX_PKG_DEPENDS="zstd"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_get_source() {
	echo "original $TERMUX_PKG_SRCDIR"
	ls $TERMUX_PKG_SRCDIR
	TERMUX_PKG_SRCDIR+="/ruff/crates/ty"
	echo "modified $TERMUX_PKG_SRCDIR"
	ls $TERMUX_PKG_SRCDIR
}

termux_step_pre_configure() {
	echo "TERMUX_PKG_SRCDIR $TERMUX_PKG_SRCDIR"
	ls $TERMUX_PKG_SRCDIR

	termux_setup_cmake
	termux_setup_rust

	# Dummy CMake toolchain file to workaround build error:
	# error: failed to run custom build command for `libz-ng-sys v1.1.15`
	# ...
	# CMake Error at /home/builder/.termux-build/_cache/cmake-3.28.3/share/cmake-3.28/Modules/Platform/Android-Determine.cmake:217 (message):
	# Android: Neither the NDK or a standalone toolchain was found.
	export TARGET_CMAKE_TOOLCHAIN_FILE="${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"
	touch "${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"

	: "${CARGO_HOME:=$HOME/.cargo}"
	export CARGO_HOME

	rm -rf "${CARGO_HOME}"/registry/src/*/sys-info-*
	cargo fetch --target "${CARGO_TARGET_NAME}"

	#patch -p1 -d "${CARGO_HOME}"/registry/src/*/sys-info-* \
	#-i "${TERMUX_PKG_BUILDER_DIR}"/0001-sys-info-replace-index-with-strchr.diff
}

termux_step_make() {
	cd "$TERMUX_PKG_SRCDIR"

	PKG_CONFIG_PATH="/usr/lib/x86_64-linux-gnu/pkgconfig/" \
	PKG_CONFIG_ALL_DYNAMIC=1 \
	ZSTD_SYS_USE_PKG_CONFIG=1 \
	cargo build --jobs "${TERMUX_PKG_MAKE_PROCESSES}" --target "${CARGO_TARGET_NAME}" --release --verbose
}

termux_step_make_install() {
	install -Dm700 -t "${TERMUX_PREFIX}"/bin ruff/target/"${CARGO_TARGET_NAME}"/release/ty
}

termux_step_post_massage() {
	rm -rf "${CARGO_HOME}"/registry/src/*/sys-info-*
}
