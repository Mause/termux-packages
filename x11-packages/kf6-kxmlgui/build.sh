TERMUX_PKG_HOMEPAGE='https://community.kde.org/Frameworks'
TERMUX_PKG_DESCRIPTION='User configurable main windows'
TERMUX_PKG_LICENSE="LGPL-2.0, LGPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION="6.16.0"
_KF6_MINOR_VERSION="${TERMUX_PKG_VERSION%.*}"
TERMUX_PKG_SRCURL=https://download.kde.org/stable/frameworks/${_KF6_MINOR_VERSION}/kxmlgui-${TERMUX_PKG_VERSION}.tar.xz
TERMUX_PKG_SHA256=26fe5375d95029c5a828d5b47fc4b20e8684bc3be88df1bc94082821ce32a74e
TERMUX_PKG_DEPENDS="kf6-kcolorscheme (>= ${_KF6_MINOR_VERSION}), kf6-kconfig (>= ${_KF6_MINOR_VERSION}), kf6-kconfigwidgets (>= ${_KF6_MINOR_VERSION}), kf6-kcoreaddons (>= ${_KF6_MINOR_VERSION}), kf6-kglobalaccel (>= ${_KF6_MINOR_VERSION}), kf6-kguiaddons (>= ${_KF6_MINOR_VERSION}), kf6-ki18n (>= ${_KF6_MINOR_VERSION}), kf6-kiconthemes (>= ${_KF6_MINOR_VERSION}), kf6-kitemviews (>= ${_KF6_MINOR_VERSION}), kf6-kwidgetsaddons (>= ${_KF6_MINOR_VERSION}), libc++, qt6-qtbase"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules (>= ${_KF6_MINOR_VERSION}), qt6-qttools"
TERMUX_PKG_AUTO_UPDATE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="
-DKDE_INSTALL_QMLDIR=lib/qt6/qml
-DKDE_INSTALL_QTPLUGINDIR=lib/qt6/plugins
"
