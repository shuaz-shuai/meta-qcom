SUMMARY = "Packages for the IQ10 RRD platform"

inherit packagegroup

PACKAGES = " \
    ${PN}-firmware \
"

RRECOMMENDS:${PN}-firmware = " \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'linux-firmware-ath12k-wcn7850', '', d)} \
    linux-firmware-qcom-nord \
    linux-firmware-qcom-nord-qupv3fw \
    linux-firmware-qcom-vpu \
"
