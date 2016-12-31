#!/bin/sh

# Determine zone name
KUBE_TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
KUBE_NODE=$(curl -s --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $KUBE_TOKEN" https://kubernetes.default/api/v1/namespaces/$NAMESPACE/pods/$HOSTNAME | jq -r '.spec.nodeName')
ZONE=$(curl -s --cacert /var/run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $KUBE_TOKEN" https://kubernetes.default/api/v1/nodes/$KUBE_NODE | jq -r '.metadata.labels."failure-domain.beta.kubernetes.io/zone"')
export ZONE

# change ownership of elasticsearch directories
chown -R elasticsearch /elasticsearch /data

# allow for memlock
ulimit -l unlimited

# run
exec sudo -E -u elasticsearch /elasticsearch/bin/elasticsearch
