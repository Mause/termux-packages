TERMUX_PKG_HOMEPAGE=https://github.com/int128/kubelogin
TERMUX_PKG_DESCRIPTION="A kubectl plugin for Kubernetes OpenID Connect (OIDC) authentication"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.32.4"
TERMUX_PKG_SRCURL=https://github.com/int128/kubelogin/archive/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=3d3f7bb52eba25885a760b51ea517514e77ab0c4f6b9fa796be3b9abc1268ded
TERMUX_PKG_AUTO_UPDATE=true

termux_step_make() {
	termux_setup_golang
	cd "$TERMUX_PKG_SRCDIR"
	mkdir -p "${TERMUX_PKG_BUILDDIR}/src/github.com/int128"
	cp -a "${TERMUX_PKG_SRCDIR}" "${TERMUX_PKG_BUILDDIR}/src/github.com/int128/kubelogin"
	cd "${TERMUX_PKG_BUILDDIR}/src/github.com/int128/kubelogin"

	go build -o kubelogin -ldflags "-X main.version=${TERMUX_PKG_VERSION}"
}

termux_step_make_install() {
	install -Dm700 ${TERMUX_PKG_BUILDDIR}/src/github.com/int128/kubelogin/kubelogin \
		$TERMUX_PREFIX/bin/kubectl-oidc_login
}
