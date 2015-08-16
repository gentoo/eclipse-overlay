# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 java-ant-2 git-r3

SLOT="0"
DESCRIPTION="Tukanni-xz for java"

MY_FNAME="org.tukaani.xz_1.3.0.v201308270617.jar"

HOMEPAGE="http://www.tukaani.org/"
EGIT_REPO_URI="http://git.tukaani.org/xz-java.git"
EGIT_COMMIT="v1.3"

LICENSE="Public domain"
KEYWORDS="~amd64"

RDEPEND=">=virtual/jdk-1.6
           dev-java/ant-core
           dev-vcs/git"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${P}"
MY_FDIR="/usr/share/tukanni"


src_compile() {
           cd "${S}/" || die "Could not change to dir '${S}'!"
           ant || die "Something went wrong during execution of executing ant on build.xml!"
}

src_install() {
           dodir "${MY_FDIR}" || die "Could not create '${MY_FDIR}'!"
           cp "${S}/build/jar/xz.jar" "${D}/${MY_FDIR}/${MY_FNAME}" || die "Jar-file could not be found in work-dir!"
}
