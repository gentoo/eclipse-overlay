# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=6

inherit eutils

MY_P=${PN%%-bin}-${PV}

DESCRIPTION="Adds 'handlers' that help reducing boilerplate code with Java"
HOMEPAGE="https://projectlombok.org/"
SRC_URI="https://projectlombok.org/downloads/${MY_P}.jar"
LICENSE="MIT"

SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.7"
RDEPEND=">=virtual/jre-1.7"

S="${WORKDIR}"

src_unpack() {
	:
}

src_install() {
	mkdir -p "${D}/usr/share/lombok" || die
	cp "${DISTDIR}/${MY_P}.jar" "${D}/usr/share/lombok/lombok.jar" || die
}
