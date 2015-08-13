# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 java-ant-2

SLOT="0"
DESCRIPTION="W3C DOM Events - Java Bindings"

MY_FNAME="events_3.0.0.draft20060413_v201105210656"

HOMEPAGE="http://www.w3.org/TR/2003/NOTE-DOM-Level-3-Events-20031107/java-binding.html"
SRC_URI="http://www.w3.org/TR/2003/NOTE-DOM-Level-3-Events-20031107/java-binding.zip -> org.w3c.dom.${MY_FNAME}.zip" 

LICENSE="License-W3C"
KEYWORDS="~amd64"

RDEPEND=">=virtual/jdk-1.6
           dev-java/ant-core"
DEPEND="${RDEPEND}"

S="${WORKDIR}"
MY_FDIR="/usr/share/w3c"

src_configure() {
           #elog "Copy files from ${FILESDIR}/ to ${S}/"
           cp -R "${FILESDIR}/" "${S}/"
           mv "${S}/files/build.xml" "${S}/"
}

src_compile() {
           cd "${S}"
           ant "-Dfilename=${MY_FNAME}"
}

src_install() {
           dodir "${MY_FDIR}"
           cp "${S}/org.w3c.dom.${MY_FNAME}.jar" "${D}/${MY_FDIR}/"
}
