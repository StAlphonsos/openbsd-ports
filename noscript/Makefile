# $OpenBSD$

FF_ADDON_NAME =		noscript
V =			2.6.9.18
COMMENT =		Flexible JS blocker for Firefox
FF_ADDON_XPI =		Yes
MAINTAINER =		sean levy <attila@stalphonsos.com>
HOMEPAGE =		http://noscript.net
MASTER_SITES =		https://secure.informaction.com/download/releases/
FLAVORS =		tbb
.if ${FLAVOR:Mtbb}
MODULES =		www/tbb
.else
MODULES =		www/firefox-addon
.endif
# GPLv2+
PERMIT_PACKAGE_CDROM =	Yes
GUID =			{73a6fe31-595d-460b-a920-fcc0f8843232}

.include <bsd.port.mk>
