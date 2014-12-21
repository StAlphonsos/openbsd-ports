# $OpenBSD$

V =		4.6
COMMENT =	marked-up plain text to formatted document converter
DISTNAME =	${GH_PROJECT}-${V}
PKGNAME =	multimarkdown-${V}
CATEGORIES =	textproc

GH_ACCOUNT =	fletcher
GH_PROJECT =	MultiMarkdown-4
GH_TAGNAME =	${V}
GH_COMMIT =	ad9595beb6f9380ad18f1fd07919a16a6d14fc46

HOMEPAGE =	http://fletcherpenney.net/multimarkdown/
MAINTAINER =	Sean Levy <attila@stalphonsos.com>

# Dual licensed: MIT and GPLv2+
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c

BUILD_DEPENDS =	devel/greg

USE_GMAKE =	Yes
ALL_TARGET =	ALL
MAKE_FLAGS =	CFLAGS="${CFLAGS} -include GLibFacade.h -DHAVE_ARC4RANDOM"

# Test files aren't included in distfile.
NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/multimarkdown ${PREFIX}/bin/

.include <bsd.port.mk>
