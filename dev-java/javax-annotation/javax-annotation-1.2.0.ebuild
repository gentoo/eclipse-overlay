# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit eutils java-pkg-2 java-ant-2

SLOT="0"
DESCRIPTION="javax.annotations"

MY_FNAME="javax.annotation_1.2.0.v201401042248.jar"

HOMEPAGE="https://repository.jboss.org/nexus/content/repositories/public/org/jboss/spec/javax/annotation/jboss-annotations-api_1.2_spec/1.0.0.Final/"
SRC_URI="https://repository.jboss.org/nexus/content/repositories/public/org/jboss/spec/javax/annotation/jboss-annotations-api_1.2_spec/1.0.0.Final/jboss-annotations-api_1.2_spec-1.0.0.Final-sources.jar" 

LICENSE="CDDL"
KEYWORDS="~amd64"

RDEPEND=">=virtual/jdk-1.6
           dev-java/ant-core"
DEPEND="${RDEPEND}"

S="${WORKDIR}"
MY_FDIR="/usr/share/javax"

src_prepare() {
           #elog "Copy files from ${FILESDIR}/ to ${S}/"
           cp -R "${FILESDIR}/build.xml" "${S}/" || die "Could not build-file from '${FILESDIR}' to '${S}'"
           epatch "${FILESDIR}/MANIFEST.MF.patch" || die "Could not patch ${S}/META-INF/MANIFEST.MF"
}

src_compile() {
           cd "${S}" || die "Could not change to dir '${S}'"
           ant || die "Could not execute ant!"
}

src_install() {
           dodir "${MY_FDIR}" || die "Could not create dir '${D}/${MY_FDIR}'"
           cp "${S}/${MY_FNAME}" "${D}/${MY_FDIR}/" || die "Could not copy jar from '${S}' to '${D}/${MY_FDIR}'"
}
