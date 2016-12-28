FROM quay.io/pires/docker-elasticsearch:5.1.1_1

MAINTAINER techmovers@salemove.com

# Install some additional packages, to communicate with kubernetes api
RUN apk add --update jq curl && rm -rf /var/cache/apk/*

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD do_not_use.yml /elasticsearch/config/elasticsearch.yml

# Install Elasticsearch plug-ins
RUN /elasticsearch/bin/elasticsearch-plugin install io.fabric8:elasticsearch-cloud-kubernetes:5.1.1 --verbose
RUN /elasticsearch/bin/elasticsearch-plugin install repository-s3 --verbose

# Override elasticsearch.yml config, otherwise plug-in install will fail
ADD elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Set environment
ENV NAMESPACE default
ENV DISCOVERY_SERVICE elasticsearch-discovery

# Override run script
COPY run.sh /

