# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

PYTHON_COMPAT=( python2_7 python3_4 pypy )

inherit distutils-r1

DESCRIPTION="Python modules to work with Debian-related data formats"
HOMEPAGE="http://packages.debian.org/sid/python-debian"
SRC_URI="mirror://debian/pool/main/${P:0:1}/${PN}/${PN}_${PV}.tar.xz"

LICENSE="GPL-2 GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="examples test"

RDEPEND="
	dev-python/chardet[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( app-arch/dpkg )"

PATCHES=(
	"${FILESDIR}"/${P}-CVE-2015-0840.patch
	"${FILESDIR}"/${P}-fix-tests.patch
	)

python_compile_all() {
	"${PYTHON}" lib/debian/doc-debtags > README.debtags || die
}

python_test() {
	pushd tests > /dev/null || die
	"${PYTHON}" -m unittest discover || die "Testing failed with ${EPYTHON}"
	popd > /dev/null || die
}

python_install_all() {
	use examples && local EXAMPLES=( examples/ )
	distutils-r1_python_install_all
}
