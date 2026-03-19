TERMUX_PKG_HOMEPAGE='https://github.com/PowerShell/PowerShell'
TERMUX_PKG_DESCRIPTION='PowerShell for every system!'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='7.6.0'
TERMUX_PKG_SRCURL=https://github.com/PowerShell/PowerShell/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='9970c95bea498a6d30587c2df4885e22f6dbbdf974d57e644046e088434a117d'
TERMUX_PKG_DEPENDS='dotnet-host, dotnet-runtime-10.0, dotnet-sdk-10.0'

termux_step_pre_configure() {
	termux_setup_dotnet
}

termux_step_make_install() {
	dotnet publish -c Release -o "${TERMUX_PREFIX}"/opt/powershell --self-contained --runtime=linux-arm64
}
