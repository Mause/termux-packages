TERMUX_PKG_HOMEPAGE='https://github.com/git-pkgs/forge'
TERMUX_PKG_DESCRIPTION='Go library and CLI for working with git forges. Supports GitHub, GitLab, Gitea/Forgejo, and Bitbucket Cloud through a single interface.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.4.0'
TERMUX_PKG_SRCURL=https://github.com/git-pkgs/forge/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='43462324ad4d1e6312aff857a31eba67dba07d7e83b541ad117ddaf54db5a744'

termux_step_pre_configure() {
	termux_setup_golang
}
