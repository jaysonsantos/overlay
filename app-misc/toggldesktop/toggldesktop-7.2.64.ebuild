# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit unpacker gnome2-utils

DESCRIPTION="Toggl Desktop Client"
HOMEPAGE=""
SRC_URI="https://assets.toggl.com/installers/${PN}_${PV}_amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
>=x11-libs/libXScrnSaver-1.2.1
"
RDEPEND="${DEPEND}"
S="${WORKDIR}"

src_unpack() {
	unpack_deb ${A}
}

src_install() {
	doins -r *
	chmod 755 "${D}/opt/toggldesktop/TogglDesktop"
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
