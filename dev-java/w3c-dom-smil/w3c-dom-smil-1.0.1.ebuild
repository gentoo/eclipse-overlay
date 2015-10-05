# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
JAVA_PKG_IUSE="source"

inherit eutils java-pkg-2 java-pkg-simple

SLOT="0"
DESCRIPTION="W3C DOM SMIL - Java Bindings"
HOMEPAGE="http://www.w3.org/TR/SVG11/java.html"
SRC_URI="http://www.w3.org/TR/2011/REC-SVG11-20110816/java-binding.zip -> ${PN}.zip"

LICENSE="W3C"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.5
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.5"

src_prepare() {
	rm -r "${WORKDIR}/org/w3c/dom/svg" || die "could not delete folder 'svg'"
}

src_install() {
	java-pkg_dojar "${PN}.jar"
	use source && java-pkg_dosrc org
}
