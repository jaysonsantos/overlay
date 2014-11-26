EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Seaborn statistical data visualization"

HOMEPAGE="http://stanford.edu/~mwaskom/software/seaborn/"
LICENSE="BSD"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${PN}-${PV}.tar.gz"

RDEPEND=">=dev-python/numpy-1.8.0-r1
	>=sci-libs/scipy-0.12.1
	>=dev-python/matplotlib-1.1.1"

SLOT="0"
KEYWORDS="~amd64 ~x86"

