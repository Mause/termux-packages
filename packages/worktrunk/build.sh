TERMUX_PKG_HOMEPAGE='https://worktrunk.dev/'
TERMUX_PKG_DESCRIPTION='Worktrunk is a CLI for Git worktree management, designed for parallel AI agent workflows'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='0.81.0'
TERMUX_PKG_SRCURL=https://github.com/max-sixty/worktrunk/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='ab5cbc30f9b07b2ccb2133813f100deda77731dad0ce440332a34090de165d2d'

termux_step_pre_configure() {
	termux_setup_rust

	cargo vendor
	find ./vendor \
		-mindepth 1 -maxdepth 1 -type d \
		! -wholename ./vendor/arboard \
		-exec rm -rf '{}' \;

	find vendor/arboard -type f -print0 | \
		xargs -0 sed -i \
		-e 's|android|disabling_this_because_it_is_for_building_an_apk|g' \
		-e "s|/tmp|$TERMUX_PREFIX/tmp|g"

	echo "" >> Cargo.toml
	echo '[patch.crates-io]' >> Cargo.toml
	echo "arboard = { path = \"./vendor/arboard\" }" >> Cargo.toml
}
