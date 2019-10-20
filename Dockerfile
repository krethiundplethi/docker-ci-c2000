FROM alpine:3.7

USER root

RUN apk update && \
    apk add --no-cache vim && \
    apk add --no-cache curl 

WORKDIR /ti
ADD files/bios_6_52_00_12.run bios.run
ADD files/xdctools_3_50_08_24_core_linux.zip xdctools.zip
ADD files/tirtos_c2000_setuplinux_2_16_01_14.bin rtos.bin
ADD files/uia_2_20_00_02.zip uia.zip
ADD files/controlSUITE3.4.9setup.zip controlsuite.zip

RUN chmod +x bios.run && ./bios.run && \
    chmod +x rtos.bin && ./rtos.bin
RUN unzip xdctools.zip && \
    unzip uia.zip && \
    unzip controlsuite.zip

CMD ["/run.sh"]
