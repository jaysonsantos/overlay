# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit unpacker

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/atom/atom/releases/download/v${PV}/atom-amd64.deb -> ${P}.deb"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=net-libs/nodejs-0.10.30
"
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	doins -r usr
	chmod 755 "${D}/usr/bin/atom"
	chmod 755 "${D}/usr/share/atom/atom"
	chmod 755 "${D}/usr/share/atom/resources/app/apm/bin/apm"
	chmod 755 "${D}/usr/share/atom/resources/app/apm/bin/node"
	find "${D}" -iname '*.node' -exec chmod 755 {} \;
}
