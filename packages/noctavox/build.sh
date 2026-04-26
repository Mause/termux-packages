TERMUX_PKG_HOMEPAGE='https://github.com/Jaxx497/NoctaVox'
TERMUX_PKG_DESCRIPTION='Local TUI Music Player'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.2.6'
TERMUX_PKG_SRCURL=https://github.com/Jaxx497/NoctaVox/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='b59911bfc43b6b3c678c5341954413e5ce55068277df70707b0479ed9a6c8208'
TERMUX_PKG_DEPENDS='dbus, libopus'
TERMUX_PKG_BUILD_DEPENDS='cmake, ninja'

termux_step_pre_configure() {
	termux_setup_rust
	termux_setup_cmake
	termux_setup_ninja

	# Dummy CMake toolchain file to workaround build error:
	# error: failed to run custom build command for `libz-ng-sys v1.1.9`
	# ...
	# CMake Error at /home/builder/.termux-build/_cache/cmake-3.28.3/share/cmake-3.28/Modules/Platform/Android-Determine.cmake:217 (message):
	# Android: Neither the NDK or a standalone toolchain was found.
	export TARGET_CMAKE_TOOLCHAIN_FILE="${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"
	touch "${TERMUX_PKG_BUILDDIR}/android.toolchain.cmake"
}
