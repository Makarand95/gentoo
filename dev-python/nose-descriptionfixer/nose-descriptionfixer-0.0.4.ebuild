# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{4,5} pypy pypy3)

inherit distutils-r1

DESCRIPTION="Fix the way tests are described when the verbose flag is used "
HOMEPAGE="https://pypi.python.org/pypi/nose-descriptionfixer"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/nose[${PYTHON_USEDEP}]"
