# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils autotools

DESCRIPTION="Instant terminal sharing"
HOMEPAGE="http://tmate.io/"
SRC_URI="https://github.com/nviennot/tmate/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug static-libs"

RDEPEND="
	sys-libs/zlib[static-libs?]
	dev-libs/openssl[static-libs?]
	dev-libs/libevent[static-libs?]
	dev-libs/msgpack[static-libs?]
	>=net-libs/libssh-0.6.0[static-libs?]
"

src_prepare() {
	# Let's use system's lib
	rm -rv libssh msgpack || die
	epatch "${FILESDIR}/${P}-use-system-libs.patch"

	eautoreconf
}

src_configure() {
	econf $(use_enable debug) $(use_enable static-libs static)
}
