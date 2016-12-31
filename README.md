# docker-elasticsearch-kubernetes

Ready to use lean Elasticsearch Docker image ready for using within a Kubernetes cluster.


## Current software

* OpenJDK JRE 8u112
* Elasticsearch 5.1.1
* Kubernetes discovery plug-in 5.1.1
* repository-s3 plug-in

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* [DISCOVERY_SERVICE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
* [NAMESPACE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
