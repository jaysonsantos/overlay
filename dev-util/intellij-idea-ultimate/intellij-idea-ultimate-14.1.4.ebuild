EAPI="5"

inherit eutils

DESCRIPTION="IntelliJ Idea"
HOMEPAGE="www.jetbrains.com/idea/"
SRC_URI="https://download.jetbrains.com/idea/ideaIU-${PV}.tar.gz -> ${P}.tar.gz"

KEYWORDS="~x86 ~amd64"

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"

SLOT="0"
RESTRICT="strip"

src_unpack() {
	unpack "${A}"
	mv idea-IU* "${P}"
}

src_install()
{
	# copy files
	dodir /opt/${PN}
	insinto /opt/${PN}
	sed 's/^LD_LIBRARY_PATH/XMODIFIERS="" LD_LIBRARY_PATH/' -i'' "bin/idea.sh"
	doins -r *


	# fix perms
	fperms a+x /opt/${PN}/bin/idea.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier   || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh   || die "fperms failed"

	# symlink
	dosym /opt/${PN}/bin/idea.sh /usr/bin/${PN}

	# desktop entry
	mv "bin/idea.png" "bin/${PN}.png"
	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "IntelliJ Idea (Ultimate)" ${PN}
}
