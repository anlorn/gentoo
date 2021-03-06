# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="user-friendly program to show you what is using up all your disk space"
HOMEPAGE="http://xdiskusage.sourceforge.net/"
SRC_URI="http://xdiskusage.sourceforge.net/${P}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~ppc x86"

RDEPEND="
	>=x11-libs/fltk-1.3:1
"
DEPEND="
	${RDEPEND}
"

src_compile() {
	emake \
		CXXFLAGS="${CXXFLAGS} $(fltk-config --cxxflags)" \
		LDLIBS="$(fltk-config --ldflags)"
}

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc README
}
