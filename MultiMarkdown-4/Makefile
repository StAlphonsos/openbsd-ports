# $OpenBSD$

V =		4.6
COMMENT =	MultiMarkdown Reimplementation in C
DISTNAME =	MultiMarkdown-4-${V}
CATEGORIES =	textproc

GH_ACCOUNT =	fletcher
GH_PROJECT =	MultiMarkdown-4
GH_TAGNAME =	${V}
GH_COMMIT =	ad9595beb6f9380ad18f1fd07919a16a6d14fc46

HOMEPAGE =	http://fletcherpenney.net/mmd
MAINTAINER =	Sean Levy <attila@stalphonsos.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

USE_GMAKE =	Yes

WANTLIB += c

BUILD_DEPENDS =	devel/greg

NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/multimarkdown ${PREFIX}/bin/

.include <bsd.port.mk>
