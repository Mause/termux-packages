TERMUX_PKG_HOMEPAGE='https://github.com/guillaumekln/faster-whisper'
TERMUX_PKG_DESCRIPTION='Faster Whisper transcription with CTranslate2'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.2.1'
TERMUX_PKG_SRCURL=https://github.com/guillaumekln/faster-whisper/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_DEPENDS="python, python-pip"
TERMUX_PKG_SHA256='ff0b5428b3a074cd63f580ae73fa21f7d9fd3bba28e0e2e097868d78d5b06f2f'

termux_step_pre_configure() {
	termux_setup_python_pip
}
