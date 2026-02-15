TERMUX_PKG_HOMEPAGE='https://github.com/OpenNMT/CTranslate2'
TERMUX_PKG_DESCRIPTION='Fast inference engine for Transformer models'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='4.7.1'
TERMUX_PKG_SRCURL=git+https://github.com/OpenNMT/CTranslate2
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='64beb499c1e33500a691dfbe10cc5def7b914413c7f7c2830b0e0d8d544a9f7e'
TERMUX_PKG_DEPENDS="libopenblas, python, python-pip"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DWITH_MKL=OFF -DWITH_CUDA=OFF -DOPENMP_RUNTIME=NONE -DWITH_RUY=ON -DWITH_OPENBLAS=ON -DCMAKE_POLICY_VERSION_MINIMUM=3.5"

set -o xtrace

termux_step_post_get_source() {
	git submodule update --init --recursive --depth=1
}

termux_step_preconfigure() {
	termux_setup_python_pip
}

termux_step_make_install() {
	cd python
	python3 -m venv .venv
	source .venv/bin/activate
	pip install -r install_requirements.txt
	pip wheel .
	deactivate
	pip install dist/*.whl
}
