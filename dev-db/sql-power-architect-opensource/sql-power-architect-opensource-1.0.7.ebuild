# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit java-utils-2

DESCRIPTION="SQL Power Architect Open Source Edition"
HOMEPAGE="http://www.sqlpower.ca/page/architect"
SRC_URI="http://download.sqlpower.ca/architect/1.0.7/community/SQL-Power-Architect-generic-jdbc-${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	>=virtual/jre-1.6
"
S="${WORKDIR}/architect-${PV}"

src_install() {
	local install_location="/opt/${PN}"
	insinto "${install_location}"
	doins -r *
	java-pkg_dolauncher sql-power-architect-opensource --jar "/opt/${PN}/architect.jar"
}