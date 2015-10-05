# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit unpacker

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://slack-ssb-updates.global.ssl.fastly.net/linux_releases/${P}-amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
gnome-base/gconf
gnome-base/gvfs
dev-libs/libgcrypt
virtual/libudev
x11-libs/libXtst
x11-libs/libnotify
gnome-base/libgnome-keyring"
S="${WORKDIR}"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	doins -r usr
	chmod 755 "${D}/usr/share/slack/slack"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}

