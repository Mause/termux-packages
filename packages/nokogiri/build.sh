TERMUX_PKG_HOMEPAGE='https://github.com/sparklemotion/nokogiri'
TERMUX_PKG_DESCRIPTION='Nokogiri (鋸) makes it easy and painless to work with XML and HTML from Ruby.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.16.2'
TERMUX_PKG_SRCURL=https://github.com/sparklemotion/nokogiri/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='b056af14f2d653146d3c0fdd082fa8c0ae77654ce938066499be5f34cb66a6b5'
TERMUX_PKG_DEPENDS='ruby, libxslt'

set -o xtrace

termux_step_make() {
	:
}

termux_step_make_install() {
	RUBY_VERSION=3.4.0
	export GEM_HOME="${TERMUX_PREFIX}/lib/ruby/gems/$RUBY_VERSION"
	cat "/usr/lib/x86_64-linux-gnu/ruby/3.2.0/rbconfig.rb"
	cat "$TERMUX_PREFIX/lib/ruby/$RUBY_VERSION/$TERMUX_ARCH-linux-android/rbconfig.rb"
	gem install bundler
	gem install rake:13.2.1 rake-compiler rake-compiler-dock:1.11.1
	BUNDLE=$GEM_HOME/bin/bundle
	$GEM_HOME/bin/rake -T
	ls rbconfig-patch.rb
	ruby -r ./rbconfig-patch.rb $GEM_HOME/bin/rake compile --trace -- --use-system-libraries || echo failed
	ls
	find . | grep mkmf.log
	cat "tmp/x86_64-linux-gnu/nokogiri/3.2.3/mkmf.log"
	exit 1
	$BUNDLE config set build.nokogiri --use-system-libraries
	$BUNDLE install --jobs "${TERMUX_PKG_MAKE_PROCESSES}"
}
