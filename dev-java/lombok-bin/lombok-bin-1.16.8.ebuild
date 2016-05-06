# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils

MY_PN="lombok"

DESCRIPTION="Project Lombok makes java a spicier language by adding 'handlers' that know how to build and compile simple, boilerplate-free, not-quite-java code."
HOMEPAGE="https://projectlombok.org/"
SRC_URI="https://projectlombok.org/downloads/${MY_PN}-${PV}.jar"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND=">=virtual/jdk-1.7
	${DEPEND}"

src_unpack() {
	# so prepare is happy about the empty dir
	mkdir ${P}
}

src_install() {
	mkdir -p "${D}/usr/share/lombok"
	cp "${DISTDIR}/${MY_PN}-${PV}.jar" "${D}/usr/share/lombok/lombok.jar"
}
