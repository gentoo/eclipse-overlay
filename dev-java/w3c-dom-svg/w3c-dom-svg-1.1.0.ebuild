# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
JAVA_PKG_IUSE="source"

inherit eutils java-pkg-2 java-pkg-simple

SLOT="0"
DESCRIPTION="W3C DOM SVG - Java Bindings."
HOMEPAGE="http://www.w3.org/TR/SVG11/java.html"
SRC_URI="http://www.w3.org/TR/2011/REC-SVG11-20110816/java-binding.zip -> ${PN}.zip"

LICENSE="W3C"
KEYWORDS="~amd64 ~x86"

MYDEPEND=">=dev-java/w3c-dom-smil-1.0.1"
DEPEND=">=virtual/jdk-1.5
	${MYDEPEND}
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.5
	${MYDEPEND}"

JAVA_GENTOO_CLASSPATH="w3c-dom-smil"

src_prepare() {
	rm -r "${WORKDIR}/org/w3c/dom/smil" || die "could not delete folder 'smil'"
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use source && java-pkg_dosrc org
}
