TERMUX_PKG_HOMEPAGE='https://github.com/openai/whisper'
TERMUX_PKG_DESCRIPTION='Robust Speech Recognition via Large-Scale Weak Supervision'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='20250625'
TERMUX_PKG_SRCURL=https://github.com/openai/whisper/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS='python-numpy, python-llvmlite'
TERMUX_PKG_SHA256='812e8a4b54e117c1bda827597f54886084bf062453ede274caf4699153b673f9'

termux_step_pre_configure() {
	termux_setup_python_pip
}
