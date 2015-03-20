# $OpenBSD$
# -*- mode: Makefile; tab-width: 4; -*-
# Module for many (all?) Firefox extensions
# Adapted from mail/enigmail/Makefile by attila@stalphonsos.com

# Teach bsd.port.mk how to unzip *.xpi files if that's what
# we're working with; you set this in the port's Makefile:
.if ${FF_ADDON_XPI:L} == "yes"
EXTRACT_CASES = *.xpi) \
	${UNZIP} -oq ${FULLDISTDIR}/$$archive -d ${WRKSRC};;
EXTRACT_SUFX = .xpi
.endif

WRKSRC ?= ${WRKDIST}/${DISTNAME}

# keep in synch with mozilla.port.mk
ONLY_FOR_ARCHS =	i386 amd64 powerpc sparc64

DISTNAME ?=		${FF_ADDON_NAME}-${V}
CATEGORIES =		www

BUILD_DEPENDS =		archivers/zip archivers/unzip
ZIP ?=				zip
ADDON_BUILD_SUBDIR ?= .
ADDON_BUILD_DIR ?= 	${WRKBUILD}/${ADDON_BUILD_SUBDIR}

# needed for the naming of the libsubprocess.so
# the xpi, and the arch matching within mozilla
.if ${MACHINE_ARCH:Mi386}
XPCOM_ABI =		x86
.elif ${MACHINE_ARCH:Mamd64}
XPCOM_ABI =		x86_64
.elif ${MACHINE_ARCH:Mpowerpc}
XPCOM_ABI =		ppc
.elif ${MACHINE_ARCH:Msparc64}
XPCOM_ABI =		sparc
.endif
SUBST_VARS += 		XPCOM_ABI

# This is a bit sleazy because it only deals with one app;
# the issue is PLIST... maybe I'm doing this wrong:
APP ?= 			{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
EXTDIR_ROOT ?=	lib/mozilla
EXTDIR_BASE ?=  extensions
EXTDIR ?=		${EXTDIR_ROOT}/${EXTDIR_ASE}/${APP}
REAL_EXTDIR ?=	${PREFIX}/${EXTDIR}

SUBST_VARS +=	EXTDIR_ROOT EXTDIR_BASE EXTDIR

.if !defined(GUID)
ERRORS += "GUID missing: www/firefox-addon ports module requires it"
.endif

.if ${FF_ADDON_XPI:L} == "yes"
pre-extract:
	mkdir -p ${ADDON_BUILD_DIR}

do-build:
	cd ${WRKSRC} && ${ZIP} -X -9r ${WRKDIST}/${DISTNAME}.xpi ./ && mv ${WRKDIST}/${DISTNAME}.xpi ${ADDON_BUILD_DIR}
.endif

do-install:
	${INSTALL_DATA_DIR} ${REAL_EXTDIR}/${GUID}
	${UNZIP} -oq ${ADDON_BUILD_DIR}/${DISTNAME}*.xpi -d ${REAL_EXTDIR}/${GUID}
