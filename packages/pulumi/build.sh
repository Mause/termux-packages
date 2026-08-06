TERMUX_PKG_HOMEPAGE='https://www.pulumi.com/'
TERMUX_PKG_DESCRIPTION='Pulumi - Infrastructure as Code in any programming language 🚀'
TERMUX_PKG_LICENSE='Apache-2.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='3.256.0'
TERMUX_PKG_SRCURL=https://github.com/pulumi/pulumi/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='43887337b91f4d61cb81d917947193337d4718dfe3ad21497857b431b279d886'

termux_step_pre_configure() {
	termux_setup_golang
}
