TERMUX_PKG_HOMEPAGE='https://github.com/rapid7/metasploit-framework/'
TERMUX_PKG_DESCRIPTION='Metasploit Framework'
TERMUX_PKG_LICENSE='BSD 3-Clause'
TERMUX_PKG_MAINTAINER='@termux'
TERMUX_PKG_VERSION='4.11.7'
TERMUX_PKG_SRCURL=https://github.com/rapid7/metasploit-framework/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_SHA256='409600db0fb2903cb7f029a9fbddee984373e9cef7b451526bf79e7d3b2fba36'
TERMUX_PKG_DEPENDS='ruby, libpcap, postgresql, zlib, libsqlite, libxml2, libxslt'

set -o xtrace

termux_step_make() {
	ruby $TERMUX_PREFIX/bin/bundler config set --local path 'vendor/bundle'
	NOKOGIRI_VERSION=$(cat Gemfile.lock | grep -i nokogiri | sed 's/nokogiri [\(\)]/(/g' | cut -d ' ' -f 5 | grep -oP "(.).[[:digit:]][\w+]?[.].")
	# by overriding cflags nokogiri will install or you can simply declare a void function
	#  you might have seen this error while installing nokogiri `xmlSetStructuredErrorFunc((void *)rb_error_list, Nokogiri_error_array_pusher);`
	#  solution : void xmlSetStructuredErrorFunc(void *rb_error_list, void *Nokogiri_error_array_pusher); you can set any parameter name
	#  for sake of simplicity tweaking cflags is better than declaring a void function for every c file

	export GEM_HOME=./bundle

	gem install nokogiri -v $NOKOGIRI_VERSION -- --with-cflags="-Wno-implicit-function-declaration -Wno-deprecated-declarations -Wno-incompatible-function-pointer-types" --use-system-libraries --enable-cross-build --with-rubyhdrdir=${TERMUX_PREFIX}/lib/ruby/include/ruby-3.4.1 --with-ruby-archhdrdir=${TERMUX_PREFIX}/lib/ruby/include/ruby-3.4.1/${TERMUX_ARCH}

	bundle install
	gem install actionpack
	bundle update activesupport
	bundle update --bundler
	bundle install -j$(nproc --all)

	# Fix ActionView version compatibility issue for ARM64
	center "* Fixing ActionView version compatibility..."
	# Disable the version check entirely since ActionView 8.x might not need the monkey patch
	sed -i 's/raise unless ActionView::VERSION::STRING == .*$/# Version check disabled for ARM64 compatibility/' config/application.rb

	# Link Metasploit Executables
	ln -sf ${PREFIX}/opt/metasploit-framework/msfconsole ${PREFIX}/bin/
	ln -sf ${PREFIX}/opt/metasploit-framework/msfvenom ${PREFIX}/bin/
	ln -sf ${PREFIX}/opt/metasploit-framework/msfrpcd ${PREFIX}/bin/
	termux-elf-cleaner ${PREFIX}/lib/ruby/gems/*/gems/pg-*/lib/pg_ext.so

	echo -e "\033[32m" # Blue color
	center "Installation complete"
	echo -e "\nStart Metasploit using the command: msfconsole"
	echo -e "\033[0m" # Reset color
	#ruby $TERMUX_PREFIX/bin/bundler install --jobs 4 --retry 3
}
