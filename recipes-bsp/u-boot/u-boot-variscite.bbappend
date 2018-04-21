FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
	file://0001-set-lvds-for-320x240-lcd.patch \
	file://0002-set-180-degree-rotate-for-lvds-display.patch \
"

LOCALVERSION_elecex-zgateway-mx6 = "-mx6"

COMPATIBLE_MACHINE = "(elecex-zgateway-mx6)"
