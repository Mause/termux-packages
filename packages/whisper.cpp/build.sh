TERMUX_PKG_HOMEPAGE=https://github.com/ggml-org/whisper.cpp
TERMUX_PKG_DESCRIPTION="whisper.cpp"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="1.7.6"
TERMUX_PKG_AUTO_UPDATE=true
# we clone to retain the .git directory, to ensure the version in the built executable is correctly populated
TERMUX_PKG_SRCURL=git+https://github.com/ggml-org/whisper.cpp
#TERMUX_PKG_DEPENDS="libc++, openssl"
#TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_EXTENSIONS='icu;parquet;json;autocomplete' -DDUCKDB_EXPLICIT_PLATFORM=linux_arm64_android"

# termux_step_pre_configure() {
# 	LDFLAGS+=" -llog"
# 	CXXFLAGS+=" -D_GLIBCXX_USE_CXX11_ABI=1"
# }
