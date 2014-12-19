# $OpenBSD$

V =		4.6
COMMENT =	MultiMarkdown Reimplementation in C
DISTNAME =	MultiMarkdown-4-${V}
CATEGORIES =	textproc

GH_ACCOUNT =	fletcher
GH_PROJECT =	MultiMarkdown-4
GH_TAGNAME =	v${V}
GH_COMMIT =	ad9595beb6f9380ad18f1fd07919a16a6d14fc46

HOMEPAGE =	http://fletcherpenney.net/mmd
MAINTAINER =	Sean Levy <attila@stalphonsos.com>

# ISC
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += Judy X11 Xext Xinerama c pthread xosd

LIB_DEPENDS =	devel/libJudy \
		x11/xosd

CONFIGURE_STYLE =	simple

NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/multimarkdown ${PREFIX}/bin/
#	${INSTALL_MAN} ${WRKSRC}/osdhud.1 ${PREFIX}/man/man1

.include <bsd.port.mk>
