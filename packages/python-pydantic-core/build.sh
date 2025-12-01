TERMUX_DEBUG_BUILD=true
TERMUX_PKG_HOMEPAGE=https://github.com/pydantic/pydantic-core
TERMUX_PKG_DESCRIPTION="Provides cryptographic recipes and primitives to Python developers"
TERMUX_PKG_LICENSE="Apache-2.0, BSD 3-Clause"
TERMUX_PKG_LICENSE_FILE="LICENSE"
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
	install /home/builder/.termux-build/python-pydantic-core/src/target/wheels/pydantic_core-$TERMUX_PKG_VERSION-cp312-cp312-linux_aarch64.whl $TERMUX_PREFIX/lib
}

#termux_step_create_debscripts() {
#	cat <<- EOF > ./postinst
#	#!$TERMUX_PREFIX/bin/sh
#	echo "Installing dependencies through pip..."
#	pip3 install $TERMUX_PKG_PYTHON_TARGET_DEPS
#	EOF
#}
