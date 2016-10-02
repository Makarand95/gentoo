# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit autotools

DESCRIPTION="FUSE filesystem for mounting a directory to another location and altering permissions"
HOMEPAGE="http://bindfs.org/"
SRC_URI="http://bindfs.org/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

RDEPEND=">=sys-fs/fuse-2.6"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

RESTRICT="test"

src_prepare() {
	local PATCHES=( "${FILESDIR}"/${PN}-1.10.7-cflags.patch )
	default
	eautoreconf
}

src_configure() {
	econf $(use_enable debug)
}