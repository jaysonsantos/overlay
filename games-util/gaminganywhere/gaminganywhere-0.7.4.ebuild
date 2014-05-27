# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/chunying/gaminganywhere/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	media-libs/libsdl2
	media-libs/sdl2-ttf

	media-libs/libogg
	media-libs/libtheora
	media-libs/libvorbis
	media-libs/libvpx
	media-sound/lame
	>=media-plugins/live-2013.02.11
	media-libs/opus
	media-libs/x264
	dev-lang/yasm
"
src_prepare() {
	rm -rfv deps* || die "Failed removing hard coded dependencies"
}
src_compile() {
	emake -C ga all
}

src_install() {
	emake -C ga install
}
