# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
ROS_REPO_URI="https://github.com/ros/robot_model"
KEYWORDS="~amd64 ~arm"
ROS_SUBDIR=${PN}
PYTHON_COMPAT=( python2_7 )

inherit ros-catkin flag-o-matic

DESCRIPTION="Constructs a KDL tree from an XML robot representation in URDF"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-libs/boost:=
	dev-ros/roscpp
	dev-ros/rosconsole
	>=dev-ros/urdf-1.12.3-r1
	sci-libs/orocos_kdl
	dev-libs/tinyxml
"
DEPEND="${RDEPEND}
	test? ( dev-ros/rostest[${PYTHON_USEDEP}] )"
PATCHES=( "${FILESDIR}/urdfdom1.patch" )

src_configure() {
	append-cxxflags -std=gnu++11
	ros-catkin_src_configure
}
