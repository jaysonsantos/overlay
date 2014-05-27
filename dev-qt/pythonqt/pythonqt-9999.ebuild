# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 cmake-utils python-utils-r1

EPYTHON=python2.7

DESCRIPTION="This is a sample skeleton ebuild file"
HOMEPAGE="http://foo.example.org/"

EGIT_REPO_URI="https://github.com/commontk/PythonQt.git"
EGIT_BRANCH="patched-4"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

IUSE=""
RDEPEND="dev-qt/qtcore:4"

src_configure() {
	local mycmakeargs=(
	"-DPYTHON_LIBRARY="$(python_get_LIBS)""
	"-DPYTHON_INCLUDE_DIR="$(python_get_includedir)""
	)
	cmake-utils_src_configure
}