SUMMARY = "Qt5 Mirror Display Test Application"
DESCRIPTION = "This application is used to test Mirror Display"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${WORKDIR}/git/main.cpp;md5=5422d4a20189ff93e4a74275d0ee41b0"

DEPENDS = "qtdeclarative"

SRC_URI = "git://github.com/alpqr/quickmwtest.git"
SRCREV = "7ca4351ad770f1a9f4f7f29b91aeddaf3d9ed474"
S = "${WORKDIR}/git"

require recipes-qt/qt5/qt5.inc

do_install() {
    install -d ${D}${datadir}/${P}
    install -m 0755 ${B}/quickmwtest ${D}${datadir}/${P}
}

FILES_${PN}-dbg += "${datadir}/${P}/.debug"
FILES_${PN} += "${datadir}"
