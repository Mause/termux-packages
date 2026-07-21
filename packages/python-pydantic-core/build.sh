TERMUX_PKG_HOMEPAGE='https://github.com/pydantic/pydantic'
TERMUX_PKG_DESCRIPTION='Core validation logic for pydantic written in rust'
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.42.0"
TERMUX_PKG_SRCURL=https://github.com/pydantic/pydantic/archive/refs/tags/core-v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=ca1afd5eb19b8caf805c366cdc7bc9b87032d35ca6ca45c29d245e0190ee8ce5
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_PYTHON_COMMON_BUILD_DEPS="setuptools>=60, setuptools_rust, wheel, typing_extensions, maturin"

termux_step_configure() {
	termux_setup_rust
	termux_setup_python_pip
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib
}

termux_step_make() {
	. "$HOME/.cargo/env"
	export LD_LIBRARY_PATH="${TERMUX_PREFIX}/lib/"
	export ANDROID_API_LEVEL=$TERMUX_PKG_API_LEVEL
	echo "Building with CARGO_TARGET_NAME=${CARGO_TARGET_NAME} LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
	cd pydantic-core
	maturin build --release --target ${CARGO_TARGET_NAME} --skip-auditwheel -vv
}

termux_step_make_install() {
	local _pyv="${TERMUX_PYTHON_VERSION/./}"
	local _whl="pydantic_core-$TERMUX_PKG_VERSION-cp$_pyv-cp$_pyv-android_24_arm64_v8a.whl" # TODO: unhardcode
	# pip install --no-deps --prefix=$TERMUX_PREFIX --force-reinstall $TERMUX_PKG_SRCDIR/target/wheels/$_whl
	cp $TERMUX_PKG_SRCDIR/pydantic-core/target/wheels/$_whl $TERMUX_PREFIX
}
