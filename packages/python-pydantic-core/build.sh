TERMUX_DEBUG_BUILD=true
TERMUX_PKG_HOMEPAGE=https://github.com/pydantic/pydantic-core
TERMUX_PKG_DESCRIPTION="Provides cryptographic recipes and primitives to Python developers"
TERMUX_PKG_LICENSE="Apache-2.0, BSD 3-Clause"
TERMUX_PKG_LICENSE_FILE="LICENSE, LICENSE.APACHE, LICENSE.BSD"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="2.20.1"
TERMUX_PKG_SRCURL=https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247/pydantic_core-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=26ca695eeee5f9f1aeeb211ffc12f10bcb6f71e2989988fda61dabd65db878d4
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_UPDATE_TAG_TYPE="newest-tag"
TERMUX_PKG_PYTHON_COMMON_DEPS="setuptools>=60, setuptools_rust, wheel, typing_extensions, maturin"

termux_step_configure() {
	termux_setup_rust
	export CARGO_BUILD_TARGET=${CARGO_TARGET_NAME}
	export PYO3_CROSS_LIB_DIR=$TERMUX_PREFIX/lib
	python3 --version
	which python3
	ls -a $(which python3)
	file $TERMUX_PREFIX/bin/python
	file $(ls -a $(which python3.11))
	/home/builder/.termux-build/python-crossenv-prefix-aarch64/build/bin/python3.11 --version || echo 'build failed'
	/home/builder/.termux-build/python-crossenv-prefix-aarch64/cross/bin/python3.11 --version || echo 'cross failed'
	echo 'okay, lets try to check the python version'
	$TERMUX_PREFIX/bin/python --version || echo 'failed'
	$TERMUX_PREFIX/bin/python3 --version || echo 'failed'
	echo 'success?'
}

termux_step_make() {
	export LD_LIBRARY_PATH="${TERMUX_PREFIX}/lib/"
	echo "Building with CARGO_TARGET_NAME=${CARGO_TARGET_NAME} LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
	maturin build --release --target ${CARGO_TARGET_NAME} --interpreter /home/builder/.termux-build/python-crossenv-prefix-aarch64/cross/bin/python3.11 -vv
	# pip3 install .
}

termux_step_create_debscripts() {
	cat <<- EOF > ./postinst
	#!$TERMUX_PREFIX/bin/sh
	echo "Installing dependencies through pip..."
	pip3 install $TERMUX_PKG_PYTHON_TARGET_DEPS
	EOF
}
