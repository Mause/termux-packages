TERMUX_PKG_HOMEPAGE='https://github.com/GrammaTech/sel'
TERMUX_PKG_DESCRIPTION='Programmatic modification and evaluation of software'
TERMUX_PKG_LICENSE='GPL-3.0'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='2024.09.30'
TERMUX_PKG_SRCURL=git+https://github.com/GrammaTech/sel
TERMUX_PKG_GIT_BRANCH=r$TERMUX_PKG_VERSION
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='66dc947984ab0866189b92ea2d5807a8056636c04be5250fbc771f810782926b'
TERMUX_PKG_DEPENDS='sbcl'
_SBCL=1.4.3

set -o xtrace

termux_step_post_get_source() {
	git submodule update --init --recursive
}

termux_step_pre_configure() {
	wget http://prdownloads.sourceforge.net/sbcl/sbcl-$_SBCL-x86-linux-binary.tar.bz2
	bzip2 -cd sbcl-$_SBCL-x86-linux-binary.tar.bz2 | tar xvf -
	curl -O https://beta.quicklisp.org/quicklisp.lisp
	"./sbcl-$_SBCL-x86-linux/run-sbcl.sh" --load quicklisp.lisp --eval '(quicklisp-quickstart:install)'
}

termux_step_make() {
	LISP_HEAP=16000 LISP=./sbcl-$_SBCL-x86-linux/run-sbcl.sh make bin/tree-sitter-interface
}

termux_step_make_install() {
	install -Dm755 -t "${TERMUX_PREFIX}"/bin "${TERMUX_PKG_SRCDIR}"/bin/tree-sitter-interface
}
