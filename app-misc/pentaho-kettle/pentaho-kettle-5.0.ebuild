# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit java-pkg-2 java-ant-2

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/pentaho/pentaho-kettle/archive/${PV}-CE.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="virtual/jdk:1.7"
RDEPEND="${DEPEND}
	virtual/jre"

S="${S}-CE"
ANT_TAKS="antcontrib.download-check"
