# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qmake-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/zealdocs/zeal/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=dev-qt/qtconcurrent-5.4.2:5
	>=dev-qt/qtwidgets-5.4.2:5
	>=dev-qt/qtsql-5.4.2:5
	>=dev-qt/qtwebkit-5.4.2:5
	>=dev-qt/qtx11extras-5.4.2:5
	"
RDEPEND="${DEPEND}"

src_configure() {
	export ZEAL_VERSION="${PV}" 
	eqmake5
}

src_compile() {
	emake
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die "emake install failed"
}
