FROM lambci/lambda-base

RUN yum install -y zip

WORKDIR /layer

# Copy fonts and config for packaging
RUN mkdir -p {etc/fonts,usr/share/{fonts,X11}} \
    && cp -R /etc/fonts/* etc/fonts \
    && cp -R /usr/share/fonts/* usr/share/fonts \
    && cp -R /usr/share/X11/fonts* usr/share/X11

# Change the font and cache directory
RUN sed -i 's/\/usr\/share/\/opt\/usr\/share/g' etc/fonts/fonts.conf \
    && sed -i 's/\/var\/cache/\/tmp\/cache/g' etc/fonts/fonts.conf

# Zip files
ENV LAYER_ZIP="layer.zip"
RUN zip -r $LAYER_ZIP etc usr \
    && mv $LAYER_ZIP /

CMD ["/bin/bash"]