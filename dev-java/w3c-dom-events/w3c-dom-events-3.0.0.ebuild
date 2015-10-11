# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
JAVA_PKG_IUSE="source"

inherit java-pkg-2 java-pkg-simple

SLOT="0"
DESCRIPTION="W3C DOM Events - Java Bindings"

HOMEPAGE="http://www.w3.org/TR/2003/NOTE-DOM-Level-3-Events-20031107/java-binding.html"
SRC_URI="http://www.w3.org/TR/2003/NOTE-DOM-Level-3-Events-20031107/java-binding.zip -> ${P}.zip"

LICENSE="W3C"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.5
	app-arch/unzip"
RDEPEND=">=virtual/jre-1.5"

src_install() {
	java-pkg_dojar "${PN}.jar"
	use source && java-pkg_dosrc org
}
