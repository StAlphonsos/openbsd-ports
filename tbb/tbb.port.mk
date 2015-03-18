# $OpenBSD$

# Module for Tor Browser Bundle (tbb) firefox extensions.
# Adapted from mail/enigmail/Makefile by attila@stalphonsos.com

# keep in synch with mozilla.port.mk
ONLY_FOR_ARCHS =	i386 amd64 powerpc sparc64

DISTNAME ?=	${TBB_DISTNAME}-${TBB_DISTVERS}
# ???
#EPOCH =		0

HOMEPAGE =	http://www.torproject.org

MASTER_SITES ?=	http://bits.haqistan.net/openbsd-tbb/

CATEGORIES =	www

# MPL
PERMIT_PACKAGE_CDROM=	Yes

CONFIGURE_STYLE =	none

TBB_MAKE_COMMAND ?= ${MAKE_PROGRAM} xpi

BUILD_DEPENDS =	archivers/zip archivers/unzip
WRKDIST =	${WRKDIR}/${TBB_DISTNAME}-${TBB_DISTVERS}

TBB_BUILDDIR ?= ${WRKBUILD}/${TBB_BUILD_SUBDIR}

# This isn't right: how to keep this synchronized with tor-browser?
TBB_VERSION ?=	4.0

# needed for the naming of the libsubprocess.so
# the xpi, and the arch matching within mozilla
.if ${MACHINE_ARCH:Mi386}
XPCOM_ABI =	x86
.elif ${MACHINE_ARCH:Mamd64}
XPCOM_ABI =	x86_64
.elif ${MACHINE_ARCH:Mpowerpc}
XPCOM_ABI =	ppc
.elif ${MACHINE_ARCH:Msparc64}
XPCOM_ABI =	sparc
.endif
SUBST_VARS += XPCOM_ABI

EXTDIR ?=	${PREFIX}/lib/tor-browser-${TBB_VERSION}/extensions/
.if !defined(GUID)
ERRORS += "GUID missing: tbb ports module requires it"
.endif
# XXX Is this right?  I took it from the torbutton install.rdf
APPS = 	{ec8030f7-c20a-464f-9b0e-13a3a9e97384}

do-build:
	cd ${WRKSRC} && ${TBB_MAKE_COMMAND}

do-install:
.for a in ${APPS}
	${INSTALL_DATA_DIR} ${EXTDIR}/${a}/${GUID}
	${UNZIP} -oq ${TBB_BUILDDIR}/${TBB_DISTNAME}*.xpi -d ${EXTDIR}/${a}/${GUID}
.endfor
