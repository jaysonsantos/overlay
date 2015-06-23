# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://github.com/exercism/cli/archive/v2.1.1.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/go-1.4.2"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack "${A}"
	mv "cli-${PV}" "${P}"
}

src_compile() {
	export GOPATH="${PWD}/gopath"
	#go get github.com/exercism/cli/exercism || die "Failed to download dependencies."
	go get ./...
	./bin/build
}

src_install() {
	insinto /usr/bin
	doins out/exercism
}
