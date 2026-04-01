TERMUX_PKG_HOMEPAGE='https://github.com/sparklemotion/nokogiri'
TERMUX_PKG_DESCRIPTION='Nokogiri (鋸) makes it easy and painless to work with XML and HTML from Ruby.'
TERMUX_PKG_LICENSE='MIT'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='1.19.2'
TERMUX_PKG_SRCURL=https://github.com/sparklemotion/nokogiri/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='e6257d775758b880bacdec1f32876f3a0db4c20b340b9f99540472aab42748cb'
TERMUX_PKG_DEPENDS='ruby, libxslt'

set -o xtrace

termux_step_make() {
	:
}

termux_step_make_install() {
	export GEM_HOME="${TERMUX_PREFIX}/lib/ruby/gems"
	gem install bundler
	bundle config build.nokogiri --use-system-libraries
	bundle install --jobs "${TERMUX_PKG_MAKE_PROCESSES}"
}
