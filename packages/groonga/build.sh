TERMUX_PKG_HOMEPAGE=https://github.com/groonga/groonga/
TERMUX_PKG_DESCRIPTION="An embeddable fulltext search engine"
TERMUX_PKG_LICENSE="LGPL-2.1"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="14.0.7"
TERMUX_PKG_SRCURL=https://github.com/groonga/groonga/releases/download/v${TERMUX_PKG_VERSION}/groonga-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=97428e49adb3542cbc0545279b66c53fcd825176be5f231feba8951096ce4095
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_FORCE_CMAKE=true
TERMUX_PKG_DEPENDS="libandroid-execinfo, libarrow-cpp, libc++, liblz4, libstemmer, onigmo, xxhash, zlib, zstd"
TERMUX_PKG_BUILD_DEPEPNDS="rapidjson"
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DGRN_WITH_APACHE_ARROW=ON
-DGRN_WITH_LIBSTEMMER=system
-DGRN_WITH_LZ4=system
-DGRN_WITH_ONIGMO=ON
-DGRN_WITH_BUNDLED_ONIGMO=OFF
-DGRN_WITH_RAPIDJSON=system
-DGRN_WITH_XXHASH=system
-DGRN_WITH_ZLIB=system
-DGRN_WITH_ZSTD=system
"