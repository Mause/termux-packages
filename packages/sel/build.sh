TERMUX_PKG_HOMEPAGE='https://github.com/GrammaTech/sel'
TERMUX_PKG_DESCRIPTION='Programmatic modification and evaluation of software'
TERMUX_PKG_LICENSE='NUnit-2.6.3'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2024.09.30'
TERMUX_PKG_SRCURL=git+https://github.com/GrammaTech/sel
TERMUX_PKG_GIT_BRANCH=r$TERMUX_PKG_VERSION
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='66dc947984ab0866189b92ea2d5807a8056636c04be5250fbc771f810782926b'
TERMUX_PKG_DEPENDS='sbcl'

termux_step_post_get_source() {
	git submodule update --init --recursive
}

termux_step_pre_configure() {
	curl -O https://beta.quicklisp.org/quicklisp.lisp
	sbcl --load quicklisp.lisp --eval '(progn (quicklisp-quickstart:install) (ql-util:without-prompting (ql:add-to-init-file)))'
}
