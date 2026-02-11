FROM node:22-bookworm-slim

WORKDIR /home/node
ENV NODE_ENV=production

# Runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  bash \
  ca-certificates \
  git \
  tini \
  gdal-bin \
  libgdal-dev \
  libpq-dev \
  proj-data \
  && rm -rf /var/lib/apt/lists/*

# Install n8n globally
RUN npm install -g n8n

# Ensure .n8n folder exists
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

# Copy entrypoint
COPY docker-entrypoint.sh /

EXPOSE 5678

USER node
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["n8n"]
