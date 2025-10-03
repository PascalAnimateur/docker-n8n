FROM docker.n8n.io/n8nio/n8n

USER root

# Install GDAL
RUN apk add --no-cache \
    gdal-tools \
    gdal-dev \
    py3-gdal

USER node
