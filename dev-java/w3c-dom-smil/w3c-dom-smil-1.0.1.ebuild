# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 java-ant-2

SLOT="0"
DESCRIPTION="W3C DOM SMIL - Java Bindings"

MY_FNAME="smil_1.0.1.v200903091627"

HOMEPAGE="http://www.w3.org/TR/SVG11/java.html"
SRC_URI="http://www.w3.org/TR/2011/REC-SVG11-20110816/java-binding.zip -> org.w3c.dom.${MY_FNAME}.zip" 

LICENSE="License-W3C"
KEYWORDS="~amd64"

RDEPEND=">=virtual/jdk-1.6
           dev-java/ant-core"
DEPEND="${RDEPEND}"

S="${WORKDIR}"
MY_FDIR="/usr/share/w3c"

src_configure() {
           #elog "Copy files from ${FILESDIR}/ to ${S}/"
           cp -R "${FILESDIR}/" "${S}/" || die "Could not copy files from '${FILESDIR}' to '${S}'"
           mv "${S}/files/build.xml" "${S}/" || die "Could not move '${S}/files/build.xml' one directory up"
}

src_compile() {
           cd "${S}" || die "Could not change to dir '${S}'"
           ant "-Ddir=svg" "-Dfilename=${MY_FNAME}" || die "Could not execute ant!"
}

src_install() {
           dodir "${MY_FDIR}" || die "Could not create dir '${D}/${MY_FDIR}'"
           cp "${S}/org.w3c.dom.${MY_FNAME}.jar" "${D}/${MY_FDIR}/" || die "Could not copy jar from '${S}' to '${D}/${MY_DIR}'"
}
