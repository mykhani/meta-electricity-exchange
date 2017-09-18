FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
	file://0001-add-device-tree-for-imx6q-elecex-zgateway.patch \
	file://0002-usb-serial-add-vid-pid-of-Quectel-EC20-GSM-modem.patch \
	file://0003-usb-serial-usb_wwan-add-zero-packet-mechanism.patch \
	file://0004-usb-serial-option-add-reset-resume.patch \
	file://0005-set-pad-mux-and-control-for-GPS-and-LTE.patch \
"

LOCALVERSION_elecex-zgateway-mx6 = "-mx6"

KERNEL_DEFCONFIG_elecex-zgateway-mx6 = "imx_v7_var_defconfig"

COMPATIBLE_MACHINE = "(elecex-zgateway-mx6)"
