FROM phusion/baseimage

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && \
    apt-get -y install vim curl && \
    apt-get -y install git && \
    apt-get -y install unzip tar python2.7 binutils 

RUN apt-get -y install libusb-0.1-4 libgconf-2-4 build-essential libpython2.7 cmake

RUN apt-get clean && rm -rf /tmp/*

WORKDIR /ti

COPY files/bios_6_52_00_12.zip .
COPY files/tirtos_c2000_2_16_01_14.zip .
COPY files/xdctools_3_50_08_24_core_linux.zip .
COPY files/uia_2_20_00_02.zip .
COPY files/controlSUITE.zip .
COPY files/ccsv8.zip .

RUN unzip bios_6_52_00_12.zip && unzip tirtos_c2000_2_16_01_14.zip && \
    unzip xdctools_3_50_08_24_core_linux.zip && unzip uia_2_20_00_02.zip && \
    unzip controlSUITE.zip && unzip ccsv8.zip

WORKDIR /

COPY files/hoss-convert /usr/local/bin/
COPY files/fix-project.sh /ti/

# RUN /ti/CCS8.2.0.00007_linux-x64/ccs_setup_linux64_8.2.0.00007.bin --mode unattended --optionfile "/ti/response.txt" --prefix "/ti"
# RUN touch run.sh && chmod +x run.sh

# CMD ["/run.sh"]
