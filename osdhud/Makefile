# $OpenBSD$

V =		0.1.5
COMMENT =	heads-up system status on-screen display
DISTNAME =	osdhud-${V}
CATEGORIES =	x11

GH_ACCOUNT =	StAlphonsos
GH_PROJECT =	osdhud
GH_TAGNAME =	v${V}
GH_COMMIT =	375af99adf1e5e2363eed6aef38007fc1ef77683

HOMEPAGE =	http://trac.haqistan.net/wiki/osdhud
MAINTAINER =	attila <attila@stalphonsos.com>

# ISC
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += Judy X11 Xext Xinerama c pthread xosd

LIB_DEPENDS =	devel/libJudy \
		x11/xosd

CONFIGURE_STYLE =	simple

NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/osdhud ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/osdhud.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
