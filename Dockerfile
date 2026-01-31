FROM docker.n8n.io/n8nio/n8n

USER root

# Install GDAL
RUN apk add --no-cache \
    gdal \
    gdal-tools \
    gdal-dev \
    ghostscript \
    imagemagick \
    libpq \
    py3-gdal

USER node
