FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
# To make the layer pass yocto-check-layer only inherit update-alternatives when building for qualcomm
ALTERNATIVES_CLASS = ""
ALTERNATIVES_CLASS:qcom = "update-alternatives"

# DSP firmware images (adsp*.mbn/cdsp*.mbn/*.jsn) and the FastRPC runtime libraries
# used to talk to them (dspso), for Nord are not yet part of upstream linux-firmware,
# so backport them from the internal artifactory drop until they land there.
NORD_ADSP_ARTIFACTORY = "https://qartifactory-edge.qualcomm.com/artifactory/qsc-releases-virtual/software/chip/si/HPASS.AT.1.0.1/00014"
NORD_CDSP_ARTIFACTORY = "https://qartifactory-edge.qualcomm.com/artifactory/qsc-releases-virtual/software/chip/si/NSP.AT.1.0.1/00013"

SRC_URI:append:nord = " \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp.mbn;subdir=nord-dspfw;name=nord-cdsp-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp_dtb.mbn;subdir=nord-dspfw;name=nord-cdsp-dtb-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp_dtbs.elf;subdir=nord-dspfw;name=nord-cdsp-dtbs-elf \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp0r.jsn;subdir=nord-dspfw;name=nord-cdsp0r-jsn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp1.mbn;subdir=nord-dspfw;name=nord-cdsp1-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp1_dtb.mbn;subdir=nord-dspfw;name=nord-cdsp1-dtb-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp1_dtbs.elf;subdir=nord-dspfw;name=nord-cdsp1-dtbs-elf \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp1r.jsn;subdir=nord-dspfw;name=nord-cdsp1r-jsn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp2.mbn;subdir=nord-dspfw;name=nord-cdsp2-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp2_dtb.mbn;subdir=nord-dspfw;name=nord-cdsp2-dtb-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp2_dtbs.elf;subdir=nord-dspfw;name=nord-cdsp2-dtbs-elf \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp2r.jsn;subdir=nord-dspfw;name=nord-cdsp2r-jsn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp3.mbn;subdir=nord-dspfw;name=nord-cdsp3-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp3_dtb.mbn;subdir=nord-dspfw;name=nord-cdsp3-dtb-mbn \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp3_dtbs.elf;subdir=nord-dspfw;name=nord-cdsp3-dtbs-elf \
    ${NORD_CDSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/cdsp3r.jsn;subdir=nord-dspfw;name=nord-cdsp3r-jsn \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/example_image.so;subdir=nord-dspso;name=nord-dsp-example-image \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/example_image_runner.so;subdir=nord-dspso;name=nord-dsp-example-image-runner \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/fastrpc_shell;subdir=nord-dspso;name=nord-dsp-fastrpc-shell \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/fastrpc_shell_unsigned;subdir=nord-dspso;name=nord-dsp-fastrpc-shell-unsigned \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libUbwcD.so;subdir=nord-dspso;name=nord-dsp-libubwcd \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libbenchmark_skel.so;subdir=nord-dspso;name=nord-dsp-libbenchmark-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libc++.so.1;subdir=nord-dspso;name=nord-dsp-libcxx \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libc++abi.so.1;subdir=nord-dspso;name=nord-dsp-libcxxabi \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libcrm_test_skel.so;subdir=nord-dspso;name=nord-dsp-libcrm-test-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libdsp_cfg_test_skel.so;subdir=nord-dspso;name=nord-dsp-libdsp-cfg-test-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libhcpfrc.so;subdir=nord-dspso;name=nord-dsp-libhcpfrc \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libloadalgo_skel.so;subdir=nord-dspso;name=nord-dsp-libloadalgo-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libmulticast_test_skel.so;subdir=nord-dspso;name=nord-dsp-libmulticast-test-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libstabilitydomain_skel.so;subdir=nord-dspso;name=nord-dsp-libstabilitydomain-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libsysmondomain_skel.so;subdir=nord-dspso;name=nord-dsp-libsysmondomain-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libsysmondspload_skel.so;subdir=nord-dspso;name=nord-dsp-libsysmondspload-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libsysmonhvxthrottle_skel.so;subdir=nord-dspso;name=nord-dsp-libsysmonhvxthrottle-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/libsysmonquery_skel.so;subdir=nord-dspso;name=nord-dsp-libsysmonquery-skel \
    ${NORD_CDSP_ARTIFACTORY}/dspso/usr/lib/dsp/version.so;subdir=nord-dspso;name=nord-dsp-version \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp.mbn;subdir=nord-dspfw;name=nord-adsp-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp_dtb.mbn;subdir=nord-dspfw;name=nord-adsp-dtb-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp_dtbs.elf;subdir=nord-dspfw;name=nord-adsp-dtbs-elf \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adspr.jsn;subdir=nord-dspfw;name=nord-adspr-jsn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adspua.jsn;subdir=nord-dspfw;name=nord-adspua-jsn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp1.mbn;subdir=nord-dspfw;name=nord-adsp1-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp1_dtb.mbn;subdir=nord-dspfw;name=nord-adsp1-dtb-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp1_dtbs.elf;subdir=nord-dspfw;name=nord-adsp1-dtbs-elf \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp1r.jsn;subdir=nord-dspfw;name=nord-adsp1r-jsn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp2.mbn;subdir=nord-dspfw;name=nord-adsp2-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp2_dtb.mbn;subdir=nord-dspfw;name=nord-adsp2-dtb-mbn \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp2_dtbs.elf;subdir=nord-dspfw;name=nord-adsp2-dtbs-elf \
    ${NORD_ADSP_ARTIFACTORY}/dspfw/lib/firmware/qcom/nord/adsp2r.jsn;subdir=nord-dspfw;name=nord-adsp2r-jsn \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/CFCM.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-cfcm \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/fastrpc_shell;subdir=nord-dspso-adsp;name=nord-dsp-adsp-fastrpc-shell \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libbenchmark_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libbenchmark-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libc++.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libcxx \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libc++abi.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libcxxabi \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libeai_service.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libeai-service \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libmulticast_test_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libmulticast-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libstabilitydomain_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libstabilitydomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libsysmondomain_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libsysmondomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libsysmonhvxthrottle_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libsysmonhvxthrottle-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/libsysmonquery_skel.so;subdir=nord-dspso-adsp;name=nord-dsp-adsp-libsysmonquery-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/SAPlusCmnModule.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-sapluscmnmodule \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/sbc_dec_module.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-sbc-dec-module \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp/sbc_enc_module.so.1;subdir=nord-dspso-adsp;name=nord-dsp-adsp-sbc-enc-module \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/fastrpc_shell;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-fastrpc-shell \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/fastrpc_shell_unsigned;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-fastrpc-shell-unsigned \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libbenchmark_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libbenchmark-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libc++.so.1;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libcxx \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libc++abi.so.1;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libcxxabi \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libcrm_test_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libcrm-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libdsp_cfg_test_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libdsp-cfg-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libmulticast_test_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libmulticast-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libstabilitydomain_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libstabilitydomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libsysmondomain_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libsysmondomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libsysmondspload_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libsysmondspload-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libsysmonhvxthrottle_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libsysmonhvxthrottle-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp1/libsysmonquery_skel.so;subdir=nord-dspso-adsp1;name=nord-dsp-adsp1-libsysmonquery-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/fastrpc_shell;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-fastrpc-shell \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/fastrpc_shell_unsigned;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-fastrpc-shell-unsigned \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libbenchmark_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libbenchmark-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libc++.so.1;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libcxx \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libc++abi.so.1;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libcxxabi \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libcrm_test_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libcrm-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libdsp_cfg_test_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libdsp-cfg-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libmulticast_test_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libmulticast-test-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libstabilitydomain_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libstabilitydomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libsysmondomain_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libsysmondomain-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libsysmondspload_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libsysmondspload-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libsysmonhvxthrottle_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libsysmonhvxthrottle-skel \
    ${NORD_ADSP_ARTIFACTORY}/dspso/usr/lib/dsp/adsp2/libsysmonquery_skel.so;subdir=nord-dspso-adsp2;name=nord-dsp-adsp2-libsysmonquery-skel \
    ${NORD_CDSP_ARTIFACTORY}/hexagon-dsp-binaries-qualcomm-sa8797p-ride-embedded.yaml;subdir=nord-dsp-conf;name=nord-dsp-conf-yaml \
"
SRC_URI[nord-cdsp-mbn.sha256sum] = "4e5a1ce97e77b493dfd6d92915c5f5dae4e76ebfe2f87aad4bb669d6619a54b2"
SRC_URI[nord-cdsp-dtb-mbn.sha256sum] = "4605c790d36892b96497f65597cfc3239036b48f073f4b520a7f4554f4ccde8c"
SRC_URI[nord-cdsp-dtbs-elf.sha256sum] = "4605c790d36892b96497f65597cfc3239036b48f073f4b520a7f4554f4ccde8c"
SRC_URI[nord-cdsp0r-jsn.sha256sum] = "6d01cd7dce745204d5de20efe57e2511149ca2a5b48ee562fbedefda573ca465"
SRC_URI[nord-cdsp1-mbn.sha256sum] = "7496281a27a1a4301f04bbc01affd71f0c8796254c62c143518c781c8aa0d781"
SRC_URI[nord-cdsp1-dtb-mbn.sha256sum] = "721994149e1eb2fafc999b17a2e74fdb56322d50b55a399384e267b33c4c5fb2"
SRC_URI[nord-cdsp1-dtbs-elf.sha256sum] = "721994149e1eb2fafc999b17a2e74fdb56322d50b55a399384e267b33c4c5fb2"
SRC_URI[nord-cdsp1r-jsn.sha256sum] = "6d01cd7dce745204d5de20efe57e2511149ca2a5b48ee562fbedefda573ca465"
SRC_URI[nord-cdsp2-mbn.sha256sum] = "3c893ca4d6da645d3fa2ac13a7a73838137256fb3cb8ac8c6577f199d542a384"
SRC_URI[nord-cdsp2-dtb-mbn.sha256sum] = "b1d5c8d28c22570427e6cf3cb4603b698465763402e160460f20e3025b1b3d37"
SRC_URI[nord-cdsp2-dtbs-elf.sha256sum] = "b1d5c8d28c22570427e6cf3cb4603b698465763402e160460f20e3025b1b3d37"
SRC_URI[nord-cdsp2r-jsn.sha256sum] = "6d01cd7dce745204d5de20efe57e2511149ca2a5b48ee562fbedefda573ca465"
SRC_URI[nord-cdsp3-mbn.sha256sum] = "a8d2e33568f72b2de6a13e7f4971ba9bc8aba1cc68ef2a2b3e2fbb8891b480db"
SRC_URI[nord-cdsp3-dtb-mbn.sha256sum] = "fd62b3cdb875817d7d5bb6a7a9f70037bce93446943a53870d2cf527098b4994"
SRC_URI[nord-cdsp3-dtbs-elf.sha256sum] = "fd62b3cdb875817d7d5bb6a7a9f70037bce93446943a53870d2cf527098b4994"
SRC_URI[nord-cdsp3r-jsn.sha256sum] = "6d01cd7dce745204d5de20efe57e2511149ca2a5b48ee562fbedefda573ca465"
SRC_URI[nord-dsp-example-image.sha256sum] = "1b495e682fe2a7e2f7af20124b424098ed4c91e9cc9d2fa5f7e4aa3a30e04af3"
SRC_URI[nord-dsp-example-image-runner.sha256sum] = "bfeb4be0feb758eaa12c7fb68dad0d2a5452d4c2b3064e4af131267e47faee6e"
SRC_URI[nord-dsp-fastrpc-shell.sha256sum] = "8bcddff80b5083ef4e0a8646f9d642b0c5a69913a476a80d837d298aadd11d82"
SRC_URI[nord-dsp-fastrpc-shell-unsigned.sha256sum] = "89166bd9f652f9d8c4b23fa2481f7b86a3dcc4b41a248b28d02857453ee1f5f2"
SRC_URI[nord-dsp-libubwcd.sha256sum] = "9a29fc4bb5398447dca9ef849083fcf707c96e59d84adbfeea2214db58ab8fb5"
SRC_URI[nord-dsp-libbenchmark-skel.sha256sum] = "bab4ba95cce1e79b2d88ce88d872fb471ef5a8146002fe1bbedcd70e1adcfee1"
SRC_URI[nord-dsp-libcxx.sha256sum] = "8361b65623e68622ca1784a79bd9b732e632848a8a757022c77e6646a378b980"
SRC_URI[nord-dsp-libcxxabi.sha256sum] = "d733b3a509642a593063c323346684518183c76229c5e92ebfa42e424cbe76ed"
SRC_URI[nord-dsp-libcrm-test-skel.sha256sum] = "837f30a6fd265fbbcf0b2b63666a7ad06821b2515fa228ed8e2e200f9fd24619"
SRC_URI[nord-dsp-libdsp-cfg-test-skel.sha256sum] = "f3a6a93facabd749719f7a8c83cb268ed778966dd0ff3a682547cd89b0ffccde"
SRC_URI[nord-dsp-libhcpfrc.sha256sum] = "6ed2593ba80ac9ddca15369e28c3c16dc553b5774cc57cfa555a70cf9325c60c"
SRC_URI[nord-dsp-libloadalgo-skel.sha256sum] = "609140ef7ac7b450d54f063587d8eff61b4c4b4453ee2b8faa722b03982e76e3"
SRC_URI[nord-dsp-libmulticast-test-skel.sha256sum] = "41ea9bb96843f8021991e0b9f85da1fd025a5e9046f9e1494e2edbe12bf2892f"
SRC_URI[nord-dsp-libstabilitydomain-skel.sha256sum] = "1d82a528cc46f942e926974ef887ed0ce8a1bea8983750f29af467577ec69fac"
SRC_URI[nord-dsp-libsysmondomain-skel.sha256sum] = "51ce717ccb59bb55600b38c20cbce4ebfd07bded402e9b3e3a065b6eeb94cee4"
SRC_URI[nord-dsp-libsysmondspload-skel.sha256sum] = "2bfefc5b304e43c1ed9902013b2eca4a7226757cd57debc3b8d969ab92e1667f"
SRC_URI[nord-dsp-libsysmonhvxthrottle-skel.sha256sum] = "224d435c186b9ba2c058dd59718037f91e36787d863287e2a54b60dfc96e5b47"
SRC_URI[nord-dsp-libsysmonquery-skel.sha256sum] = "daa9a8593cbbc82407a5c0c497edf1431912ac8acb525d1e5b788976296e312b"
SRC_URI[nord-dsp-version.sha256sum] = "c80d9f67eca5e5857cdfd1413ec71c29eb6e7ae6b049235008dc397a6406dded"
SRC_URI[nord-adsp-mbn.sha256sum] = "ef24b3d965391984e4c553d3bef09625f3bb906ba1cb9402f0076cc49f96733e"
SRC_URI[nord-adsp-dtb-mbn.sha256sum] = "3d946bc761d17ca4097558edd857bd8691eb92094ffd9881bb32f533ea491172"
SRC_URI[nord-adsp-dtbs-elf.sha256sum] = "3d946bc761d17ca4097558edd857bd8691eb92094ffd9881bb32f533ea491172"
SRC_URI[nord-adspr-jsn.sha256sum] = "66ce8531efb7979d234e0f0eabbe18d038ac97da771a8a194f613df8f0724e81"
SRC_URI[nord-adspua-jsn.sha256sum] = "982a99853495e34726b8e44697fdfad303334de0a67cbf6cde306c8f1731000b"
SRC_URI[nord-adsp1-mbn.sha256sum] = "3b255498cd197e78391c01bf8643adc7e9a5b93e804b3aa8cb690d5aff485efb"
SRC_URI[nord-adsp1-dtb-mbn.sha256sum] = "0602225f2a771306374f89709c82e0d992030309b1085901f9ddb05251b80695"
SRC_URI[nord-adsp1-dtbs-elf.sha256sum] = "0602225f2a771306374f89709c82e0d992030309b1085901f9ddb05251b80695"
SRC_URI[nord-adsp1r-jsn.sha256sum] = "c49c8c20d6128d5b1bfab6407152437886a3b2ba7513c1cdda906b6edb9542bc"
SRC_URI[nord-adsp2-mbn.sha256sum] = "d1f65c287ade038a7c1da0457c74c86d08c962f531fb22cc4a742bf52edb3f12"
SRC_URI[nord-adsp2-dtb-mbn.sha256sum] = "ea3fa118267586e4dc3262125a695a736b0d5577062f7cab6f2e5559825e09c0"
SRC_URI[nord-adsp2-dtbs-elf.sha256sum] = "ea3fa118267586e4dc3262125a695a736b0d5577062f7cab6f2e5559825e09c0"
SRC_URI[nord-adsp2r-jsn.sha256sum] = "027853e7eec9bdf95ed63c5e3db8146ab3605daab074e769b0bfd9ba5cbc255a"
SRC_URI[nord-dsp-adsp-cfcm.sha256sum] = "f3020029a783a55e2072aedd69667f3780e0abc37c4763a87a21e6c5a72112ad"
SRC_URI[nord-dsp-adsp-fastrpc-shell.sha256sum] = "e554f26123f067f2d10bd39e60a02861a645687353647165a8545ba1066812e2"
SRC_URI[nord-dsp-adsp-libbenchmark-skel.sha256sum] = "8099963b24925109ef5be30cb56808b7f4567ae51a6ca02aa8b2479ff3b95b10"
SRC_URI[nord-dsp-adsp-libcxx.sha256sum] = "3cabc7b43a32901d1ce04f8c6fdebf4ff5eda7d16821c3e82f20ccacd393de25"
SRC_URI[nord-dsp-adsp-libcxxabi.sha256sum] = "dcf003c35191ec093af4837a81e03030edad8144fababe204b0603657bd6e145"
SRC_URI[nord-dsp-adsp-libeai-service.sha256sum] = "41eb116a41d23cb74e689c87a18625773c09aafe8283fb3a469dacbaf505e78a"
SRC_URI[nord-dsp-adsp-libmulticast-test-skel.sha256sum] = "d5782a7dd2b5d7c6ec4cc6c7431c669f4446ded2221d2813f64665e1a73f3381"
SRC_URI[nord-dsp-adsp-libstabilitydomain-skel.sha256sum] = "d6500da4dc425a83326f4b5c4832651e1de1dc1b7c922628167ab7eb172c7a00"
SRC_URI[nord-dsp-adsp-libsysmondomain-skel.sha256sum] = "691f803f6d1b935eeb1099aef82e49bab654b44a6c715bab490357536a66ade5"
SRC_URI[nord-dsp-adsp-libsysmonhvxthrottle-skel.sha256sum] = "9fc8d5a965c397b7fa3f557adb83f03e3359fc7b2adf267f3526b2cc4b1e8765"
SRC_URI[nord-dsp-adsp-libsysmonquery-skel.sha256sum] = "fb637f759fa5fe3bbc1d6d9efc66d02566219780f1cf1ff36f07ce733bd8fe83"
SRC_URI[nord-dsp-adsp-sapluscmnmodule.sha256sum] = "e99a76b6d2c38418bf1e50188031aba22d87439e290eaeb403bef7ab1f90a865"
SRC_URI[nord-dsp-adsp-sbc-dec-module.sha256sum] = "788adc91e76363deaab06133afdfbfbb8f72a31d9eb751422aeed1f289e4ac3c"
SRC_URI[nord-dsp-adsp-sbc-enc-module.sha256sum] = "2ad702967cc8dad43b24fa51315c67f9520e19d3bacaf09efc1ff324e6cba061"
SRC_URI[nord-dsp-adsp1-fastrpc-shell.sha256sum] = "2028d984416bf0222b99c5c89fb32e35a414bb74bd8abf06c28aeff8e65988ef"
SRC_URI[nord-dsp-adsp1-fastrpc-shell-unsigned.sha256sum] = "df560c57129ee1fc7f28c144a46212385863577f2b1b805a94f39b35ec91c9f8"
SRC_URI[nord-dsp-adsp1-libbenchmark-skel.sha256sum] = "3d966a0b1b6ee90bf984d82c8bbac55f4fb4d15723f9ce224b9a627d137fa8c5"
SRC_URI[nord-dsp-adsp1-libcxx.sha256sum] = "8361b65623e68622ca1784a79bd9b732e632848a8a757022c77e6646a378b980"
SRC_URI[nord-dsp-adsp1-libcxxabi.sha256sum] = "d733b3a509642a593063c323346684518183c76229c5e92ebfa42e424cbe76ed"
SRC_URI[nord-dsp-adsp1-libcrm-test-skel.sha256sum] = "ed642ad7916c525c29055f614d8eec567836f72edb184b3da6d185ffd228fc1a"
SRC_URI[nord-dsp-adsp1-libdsp-cfg-test-skel.sha256sum] = "64d24dd7c7e560965623aa42d827846aa77e8e74c030f9658e4f6b06780170e8"
SRC_URI[nord-dsp-adsp1-libmulticast-test-skel.sha256sum] = "268a1e37540d3fdf668dea1343e68203462aaa5b1b7e84767bf25582450afd57"
SRC_URI[nord-dsp-adsp1-libstabilitydomain-skel.sha256sum] = "9fdbcce66588b2191dd4f6dfd05fc25af3f63a2140603800f4024577af549a13"
SRC_URI[nord-dsp-adsp1-libsysmondomain-skel.sha256sum] = "7a320bab61e93d37969111ad1ca9f97237addbb8f145babdd1b2b5864c602ca4"
SRC_URI[nord-dsp-adsp1-libsysmondspload-skel.sha256sum] = "8be428199e8fcfe750c452fd51b28b89a54cef26bff2442087bcdfe5f7c6d2f8"
SRC_URI[nord-dsp-adsp1-libsysmonhvxthrottle-skel.sha256sum] = "219b7313e90145a69515664e79853c582a969038522a1b7b4049b7bfa483721a"
SRC_URI[nord-dsp-adsp1-libsysmonquery-skel.sha256sum] = "1dc5985e0f85d663d1a5fcb1c39eb6f4804712111fe4c961ede057e483a5302d"
SRC_URI[nord-dsp-adsp2-fastrpc-shell.sha256sum] = "f467362abc3887b1f3822031a6b4b6a69da11c6b9a32b8b07341c994b5df3baa"
SRC_URI[nord-dsp-adsp2-fastrpc-shell-unsigned.sha256sum] = "c47a7db7be56eb56a93a63027c61ef777595e5605135ed8517a14dbdd0a36355"
SRC_URI[nord-dsp-adsp2-libbenchmark-skel.sha256sum] = "c9a005eb9c136d5e2eb47f13108f91cf09870329c4579167f4cc2b47d7f0e847"
SRC_URI[nord-dsp-adsp2-libcxx.sha256sum] = "8361b65623e68622ca1784a79bd9b732e632848a8a757022c77e6646a378b980"
SRC_URI[nord-dsp-adsp2-libcxxabi.sha256sum] = "d733b3a509642a593063c323346684518183c76229c5e92ebfa42e424cbe76ed"
SRC_URI[nord-dsp-adsp2-libcrm-test-skel.sha256sum] = "c895f11faf0ee940c4711853d619ad1600de1210d2cff36ddfb0249373f0948b"
SRC_URI[nord-dsp-adsp2-libdsp-cfg-test-skel.sha256sum] = "f83c20b85b7429b6d7c67ea02a1a528b22461a3dfb08d85a6818eccf5e5cb8e8"
SRC_URI[nord-dsp-adsp2-libmulticast-test-skel.sha256sum] = "e32b325eefa7b0f296128b145cf9f52a0e987717e54d20a9b880731e1642132f"
SRC_URI[nord-dsp-adsp2-libstabilitydomain-skel.sha256sum] = "3a76ee9993076493d46dd9c7a7631c3671e02cf1eb78a6bd0c3b16866623192c"
SRC_URI[nord-dsp-adsp2-libsysmondomain-skel.sha256sum] = "c90b1bf5305eb2981e31756daf5e3f270b11f5a11d979d2a82d8078e625a0130"
SRC_URI[nord-dsp-adsp2-libsysmondspload-skel.sha256sum] = "c947094640e99d5fb8636620d0b7f66c55ba8fbedffe7b8e1e82edd630278264"
SRC_URI[nord-dsp-adsp2-libsysmonhvxthrottle-skel.sha256sum] = "5084167444b5a4888cdc5e645415ee022443028d4bb25fb5bd6a8f371d8362c2"
SRC_URI[nord-dsp-adsp2-libsysmonquery-skel.sha256sum] = "d7c5c6e62942ecb7a92bb9b1ba010cfb324e964c377e77bb62d9fa8f349cf4aa"
SRC_URI[nord-dsp-conf-yaml.sha256sum] = "1e689ede7e1224810eacdea6a43def6809d10799132bd661516d603376180f32"

PACKAGES:prepend:nord = "${PN}-qcom-nord "

LICENSE:${PN}-qcom-nord = "LicenseRef-Firmware-qcom-2"
RDEPENDS:${PN}-qcom-nord = "${PN}-qcom-2-license"
FILES:${PN}-qcom-nord = " \
    ${firmwaredir}/qcom/nord \
    ${datadir}/qcom/nord \
    ${datadir}/qcom/conf.d/hexagon-dsp-binaries-qualcomm-sa8797p-ride-embedded.yaml \
"
INSANE_SKIP:${PN}-qcom-nord = "already-stripped arch libdir file-rdeps textrel"
SKIP_FILEDEPS:${PN}-qcom-nord = "1"
INHIBIT_SYSROOT_STRIP = "1"

inherit_defer ${ALTERNATIVES_CLASS}

# firmware-ath6kl provides updated bdata.bin, which can not be accepted into main linux-firmware repo
ALTERNATIVE:${PN}-ath6k:qcom = "ar6004-hw13-bdata"
ALTERNATIVE_LINK_NAME[ar6004-hw13-bdata] = "${nonarch_base_libdir}/firmware/ath6k/AR6004/hw1.3/bdata.bin${@fw_compr_file_suffix(d)}"

do_install:append:nord() {
    install -d ${D}${firmwaredir}/qcom/nord
    install -m 0644 ${UNPACKDIR}/nord-dspfw/*.mbn ${UNPACKDIR}/nord-dspfw/*.jsn ${UNPACKDIR}/nord-dspfw/*.elf ${D}${firmwaredir}/qcom/nord/

    install -d ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/cdsp
    install -m 0755 ${UNPACKDIR}/nord-dspso/* ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/cdsp/

    install -d ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp
    install -m 0755 ${UNPACKDIR}/nord-dspso-adsp/* ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp/

    install -d ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp1
    install -m 0755 ${UNPACKDIR}/nord-dspso-adsp1/* ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp1/

    install -d ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp2
    install -m 0755 ${UNPACKDIR}/nord-dspso-adsp2/* ${D}${datadir}/qcom/nord/Qualcomm/SA8797P-Ride-Embedded/dsp/adsp2/

    install -d ${D}${datadir}/qcom/conf.d
    install -m 0644 ${UNPACKDIR}/nord-dsp-conf/hexagon-dsp-binaries-qualcomm-sa8797p-ride-embedded.yaml ${D}${datadir}/qcom/conf.d/
}
