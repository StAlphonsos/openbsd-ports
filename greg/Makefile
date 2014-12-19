# $OpenBSD$

V =		0.4.5
COMMENT =	PEG-based parser generator
DISTNAME =	greg-${V}
CATEGORIES =	devel

GH_ACCOUNT =	fasterthanlime
GH_PROJECT =	greg
GH_TAGNAME =	v${V}
GH_COMMIT =	e6b8bc461c0d948e97187d5ff6ea579d9addb7dc

HOMEPAGE =	https://github.com/fasterthanlime/greg
MAINTAINER =	Sean Levy <attila@stalphonsos.com>

# MIT
PERMIT_PACKAGE_CDROM =	Yes

WANTLIB += c

# I think this is okay...
#NO_TEST =	Yes

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/greg ${PREFIX}/bin/

.include <bsd.port.mk>
