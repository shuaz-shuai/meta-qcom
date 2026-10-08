# Temporary override for Nord SoC bring-up.
# Nord kernel support is available in the 'qcom-next' branch with
# tag: qcom-next-7.3-rc4-20261013, but we can't move to this tag
# globally yet due to test failures on other SoCs.
# To work around this, only use this tag for Nord. Drop this file once
# all SoCs are functional against a single 'qcom-next' tag.

# tag: qcom-next-7.3-rc4-20261013
LINUX_VERSION:nord = "7.2+7.3-rc4+nord"
SRCREV:nord = "cb7a416d2476d022a449e7d52475c28a6feb390d"

SRC_URI:append:nord = " \
    file://0001-FROMLIST-dt-bindings-phy-qcom-sc8280xp-qmp-usb43dp-p.patch \
    file://0002-FROMLIST-dt-bindings-phy-qcom-snps-eusb2-phy-Add-Nor.patch \
    file://0003-FROMLIST-phy-phy-snps-eusb2-Enable-AHB2PHY-bus-clock.patch \
    file://0004-FIXUP-arm64-dts-qcom-nord-embedded-Add-AHB2PHY-clock.patch \
    file://0005-PENDING-arm64-dts-qcom-nord-ride-embedded-disable-md.patch \
    file://0006-FIXUP-ASoC-qcom-sc8280xp-fix-audio-capture-issue.patch \
    file://0007-FIXUP-arm64-dts-qcom-nord-ride-embedded-Fix-Audio-ca.patch \
    file://0008-FIXUP-arm64-dts-qcom-nord-Add-missing-vmids-for-adsp.patch \
"
