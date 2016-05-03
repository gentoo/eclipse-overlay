# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils

DESCRIPTION="Project Lombok makes java a spicier language by adding 'handlers' that know how to build and compile simple, boilerplate-free, not-quite-java code."
HOMEPAGE="https://projectlombok.org/"
SRC_URI="https://projectlombok.org/downloads/${P}.jar"
LICENSE="MIT"

SLOT="0"
KEYWORDS="x86 amd64"

DEPEND=">=virtual/jdk-1.7"
RDEPEND="${DEPEND}"

src_unpack() {
	# so prepare is happy about the empty dir
	mkdir ${P}
}

src_install() {
	mkdir ${D}/usr/share/lombok -p
	cp ${DISTDIR}/${P}.jar ${D}/usr/share/lombok/lombok.jar
}
