# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=2
JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-ant-2

MY_P="apache-${P}"
DESCRIPTION="A low-overhead robust logging package for Java"
SRC_URI="https://archive.apache.org/dist/logging/${PN}/${PV}/${MY_P}.tar.gz"
HOMEPAGE="http://logging.apache.org/log4j/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc source"

CDEPEND=""

RDEPEND=">=virtual/jre-1.4
		${CDEPEND}"

DEPEND=">=virtual/jdk-1.4
		${CDEPEND}"

S="${WORKDIR}/${MY_P}"

java_prepare() {
	rm -rf dist/
	java-pkg_filter-compiler jikes
	rm -v *.jar || die
}

JAVA_ANT_REWRITE_CLASSPATH="true"
JAVA_ANT_IGNORE_SYSTEM_CLASSES="true"
EANT_EXTRA_ARGS="-Djaxp-present=true"
EANT_DOC_TARGET=""

src_compile() {
	java-pkg-2_src_compile
}

src_install() {
	java-pkg_newjar dist/lib/${P}.jar ${PN}.jar

	if use doc ; then
		java-pkg_dohtml -r site/*
		rm -fr "${D}/usr/share/doc/${PF}/html/apidocs"
		java-pkg_dojavadoc --symlink apidocs site/apidocs
	fi
	use source && java-pkg_dosrc src/main/java/*
}
