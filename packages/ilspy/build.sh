TERMUX_PKG_HOMEPAGE='https://github.com/icsharpcode/ILSpy'
TERMUX_PKG_DESCRIPTION='.NET Decompiler with support for PDB generation, ReadyToRun, Metadata (&more) - cross-platform!'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='9.1'
TERMUX_PKG_SRCURL=git+https://github.com/icsharpcode/ILSpy
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='1e69ecea8c4495f6b8ac76162c86ca47b682a70af657a4b24b04bde1430d8ea5'
TERMUX_PKG_DEPENDS="dotnet-host, dotnet-runtime-10.0"

set -o xtrace

termux_step_pre_configure() {
	TERMUX_DOTNET_VERSION=10.0
	termux_setup_dotnet
	dotnet restore ICSharpCode.Decompiler
	dotnet tool install --global powershell
}

termux_step_make() {
	dotnet publish ICSharpCode.Decompiler \
	--framework "net${TERMUX_DOTNET_VERSION}" \
	--no-self-contained \
	--runtime "$DOTNET_TARGET_NAME" \
	--configuration Release \
	--output build/ \
	/p:AssemblyVersion="${TERMUX_PKG_VERSION}" \
	/p:FileVersion="${TERMUX_PKG_VERSION}" \
	/p:InformationalVersion="${TERMUX_PKG_VERSION}" \
	/p:Version="${TERMUX_PKG_VERSION}"
	dotnet build-server shutdown
}
