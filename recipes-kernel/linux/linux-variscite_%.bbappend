FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
                 file://0001-imx6qdl-var-som-disable-rts-cts-signals-for-gps-uart.patch \
                 file://0002-usb-serial-add-vid-pid-of-Quectel-EC20-GSM-modem.patch \
                 file://0003-usb-serial-usb_wwan-add-zero-packet-mechanism.patch \
                 file://0004-usb-serial-option-add-reset-resume.patch \
"
