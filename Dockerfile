FROM amazonlinux:2

RUN yum install -y \
    rpmdevtools \
    yum-utils

WORKDIR /tmp

# Download and extract stix-fonts
RUN yumdownloader stix-fonts.noarch \
    && rpmdev-extract *rpm

WORKDIR /layer

# Copy fonts and config for packaging
RUN mkdir -p {etc/fonts,usr/share} \
    && cp -aR /tmp/*/usr/share/font* usr/share

COPY ./fonts.conf etc/fonts

# Zip files
ENV LAYER_ZIP="layer.zip"
RUN zip -r $LAYER_ZIP etc usr \
    && mv $LAYER_ZIP /