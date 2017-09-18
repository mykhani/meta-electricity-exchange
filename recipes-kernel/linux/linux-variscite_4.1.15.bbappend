FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
	file://0001-add-device-tree-for-imx6q-elecex-zgateway.patch \
"

LOCALVERSION_elecex-zgateway-mx6 = "-mx6"

KERNEL_DEFCONFIG_elecex-zgateway-mx6 = "imx_v7_var_defconfig"

COMPATIBLE_MACHINE = "(elecex-zgateway-mx6)"
