# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-r3 cmake-utils vala gnome2-utils

DESCRIPTION=""
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/sgringwe/rdio.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="sound-menu libnotify"
DEPEND="
dev-lang/vala
dev-libs/glib:2
x11-libs/gtk+:3
net-libs/libsoup
dev-libs/json-glib
net-libs/webkit-gtk:3
sound-menu? ( dev-libs/libindicate dev-libs/libdbusmenu )
libnotify? ( x11-libs/libnotify )
"

src_prepare() {
	cmake-utils_src_prepare
	vala_src_prepare
}

src_configure() {
  local mycmakeargs=(
    $(cmake-utils_use_has sound-menu INDICATE)
    $(cmake-utils_use_has libnotify LIBNOTIFY)
    "-DVALA_EXECUTABLE="$VALAC""
    "-DICON_UPDATE=OFF"
  )

  echo > schemas/CMakeLists.txt
  rm cmake/GSettings.cmake
  
  mv schemas/apps.rdio.gschema.xml schemas/org.gnome.apps.rdio.gschema.xml
  epatch "${FILESDIR}/schemas-file.patch"
  epatch "${FILESDIR}/application-id.patch"
  epatch "${FILESDIR}/settings-prefix.patch"
  epatch "${FILESDIR}/CMakeLists.txt.patch"
  cmake-utils_src_configure
}

src_install() {
  cmake-utils_src_install
}

pkg_preinst() {
  local schemas_path="$ED/usr/share/glib-2.0/schemas"
  mkdir -p $schemas_path
  
  cp $WORKDIR/$P/schemas/*.xml $schemas_path/
  
  gnome2_schemas_savelist
  gnome2_icon_savelist
}

pkg_postinst() {
  gnome2_schemas_update
  gnome2_icon_cache_update
}

pkg_postrm() {
  gnome2_schemas_update
  gnome2_icon_cache_update
}