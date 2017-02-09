FROM quay.io/pires/docker-elasticsearch:5.2.0

MAINTAINER techmovers@salemove.com

# Add user/group
RUN addgroup sudo \
  && adduser -D -g '' elasticsearch \
  && adduser elasticsearch sudo \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Install some additional packages, to communicate with kubernetes api
RUN apk add --update jq curl \
  && rm -rf /var/cache/apk/*

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/elasticsearch-plugin install repository-s3 --verbose

# Add config
ADD config /elasticsearch/config

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Override run script
COPY run.sh /

