TERMUX_PKG_HOMEPAGE='https://github.com/icsharpcode/ILSpy'
TERMUX_PKG_DESCRIPTION='.NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more) - cross-platform!'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='9.1'
TERMUX_PKG_SRCURL=https://github.com/icsharpcode/ILSpy/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='1e69ecea8c4495f6b8ac76162c86ca47b682a70af657a4b24b04bde1430d8ea5'

termux_step_pre_configure() {
	termux_setup_dotnet
}
