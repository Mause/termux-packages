TERMUX_PKG_HOMEPAGE='https://github.com/pydantic/pydantic-core'
TERMUX_PKG_DESCRIPTION='Core validation logic for pydantic written in rust'
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.41.5"
TERMUX_PKG_SRCURL=https://github.com/pydantic/pydantic-core/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=872f700f7e42723e17cec5291d00677d790c14768030f4f37e7de72c2935d731
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_PYTHON_COMMON_DEPS="setuptools>=60, setuptools_rust, wheel, typing_extensions, maturin"

termux_step_configure() {
	termux_setup_rust
	termux_setup_python_pip
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib
}

termux_step_make() {
	. "$HOME/.cargo/env"
	export LD_LIBRARY_PATH="${TERMUX_PREFIX}/lib/"
	echo "Building with CARGO_TARGET_NAME=${CARGO_TARGET_NAME} LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
	maturin build --release --target ${CARGO_TARGET_NAME} --skip-auditwheel -vv
	# pip3 install .
}

termux_step_make_install() {
	local _pyv="${TERMUX_PYTHON_VERSION/./}"
	local _whl="pydantic_core-$TERMUX_PKG_VERSION-cp$_pyv-cp$_pyv-linux_$TERMUX_ARCH.whl"
	pip install --no-deps --prefix=$TERMUX_PREFIX --force-reinstall $TERMUX_PKG_SRCDIR/target/wheels/$_whl
	cp $TERMUX_PKG_SRCDIR/target/wheels/$_whl $TERMUX_PREFIX
}

#termux_step_create_debscripts() {
#	cat <<- EOF > ./postinst
#	#!$TERMUX_PREFIX/bin/sh
#	echo "Installing dependencies through pip..."
#	pip3 install $TERMUX_PKG_PYTHON_TARGET_DEPS
#	EOF
#}
