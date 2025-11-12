TERMUX_PKG_HOMEPAGE='https://github.com/jonathanmagambo/otterlang'
TERMUX_PKG_DESCRIPTION='Otterlang programming language 🦦'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.0.1'
TERMUX_PKG_GIT_BRANCH=main
_COMMIT='ea61aa0a7869741edaa641c06831afca3bbd221a'
TERMUX_PKG_SRCURL=git+https://github.com/jonathanmagambo/otterlang
TERMUX_PKG_SHA256='b532a8b732e0a953116a44e98dc2d289053604bb5b6fff4ab2ab4694de510d07'
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true

termux_step_post_get_source() {
	git checkout $_COMMIT
}
