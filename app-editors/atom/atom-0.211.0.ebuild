# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/atom/atom/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	>=net-libs/nodejs-0.10.30
	dev-lang/python:2"
RDEPEND="${DEPEND}"

src_compile() {
	export EPYTHON=python2.7
	script/build
}

src_install() {
	script/grunt install --install-dir="${D}"
}
