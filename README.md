# docker-elasticsearch-kubernetes

<<<<<<< HEAD
Ready to use lean Elasticsearch Docker image ready for using within a Kubernetes cluster.
=======
Ready to use lean (119MB) Elasticsearch Docker image ready for using within a Kubernetes cluster.
>>>>>>> 5.2.0


## Current software

* OpenJDK JRE 8u112
* Elasticsearch 5.2.0
* repository-s3 plug-in

## Run

See [pires/kubernetes-elasticsearch-cluster](https://github.com/pires/kubernetes-elasticsearch-cluster) for instructions on how to run, scale and use Elasticsearch on Kubernetes.

## Environment variables

This image can be configured by means of environment variables, that one can set on a `Deployment`.

Besides the [inherited ones](https://github.com/pires/docker-elasticsearch#environment-variables), this container image provides the following:

* [DISCOVERY_SERVICE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
* [NAMESPACE](https://github.com/fabric8io/elasticsearch-cloud-kubernetes#kubernetes-pod-discovery)
