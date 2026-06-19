SUMMARY = "OTA demo image: RAUC A/B (tryboot) + vsomeip/CommonAPI + Qt IVI"
LICENSE = "MIT"

inherit core-image

IMAGE_INSTALL:append = " \
    rauc \
    vsomeip \
    capicxx-core-runtime \
    capicxx-someip-runtime \
    ota-agent \
    ota-ivi \
    openssh \
"

# A/B disk layout produced by wic
IMAGE_FSTYPES = "wic.bz2"
WKS_FILE = "ota-ab.wks"

# NOTE: tryboot/autoboot.txt boot-partition wiring is validated in Spike B before this is final.
