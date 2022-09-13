 [![Gitter](https://img.shields.io/badge/Available%20on-Intersystems%20Open%20Exchange-00b2a9.svg)](https://openexchange.intersystems.com/package/interoperability-soap)
 [![Quality Gate Status](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Finteroperability-soap&metric=alert_status)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Finteroperability-soap)
 [![Reliability Rating](https://community.objectscriptquality.com/api/project_badges/measure?project=intersystems_iris_community%2Finteroperability-soap&metric=reliability_rating)](https://community.objectscriptquality.com/dashboard?id=intersystems_iris_community%2Finteroperability-soap)
# interoperability-soap
I started from iris-interoperability-template. It contained a simple interoperablity solution which reads data from Reddit, filters it, and directs outputs into files or sends via email.

## Error encountered
```
the --mount option requires BuildKit. Refer to https://docs.docker.com/go/buildkit/ to learn how to build images with BuildKit enabled
ERROR: Service 'iris' failed to build : Build failed
```
## Workaround
My docker-compose installation did not support BuildKit. So I built the image separately and used the image in docker-compose.yaml.
```
DOCKER_BUILDKIT=1 sudo docker build --no-cache --progress=plain --tag soapint .
```

## Online Demo
You can find online demo here - [Production Configuration](https://interoperability-soap.demo.community.intersystems.com/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.Demo.Production) or [Management Portal](https://interoperability-soap.demo.community.intersystems.com/csp/sys/UtilHome.csp)

## Why interoperability-soap?

My team needs to migrate a Generic SOAP Service interface from an older HealthShare Health Connect version to our IRIS Interoperability instances running on Red Hat OpenShift Kubernetes Container Platform. We encountered errors and I wanted a tool to help troubleshooting.

I imported Services_Role and related resources. I added Services-Role to UnknownUser. I created a Web Application with dispatch class.

I added a Service to the production.
I cloned SOAP Generic Service, SOAP Service, and WebService classes and added debugging statements so I could see what methods get executed:
![screenshot](https://github.com/oliverwilms/bilder/blob/main/CaptureDCSOAP.PNG)
## Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker.com/products/docker-desktop) installed.

## Installation: ZPM

Open IRIS Namespace with Interoperability Enabled.
Open Terminal and call:
USER>zpm "install interoperability-soap"

## Installation: Docker
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/oliverwilms/interoperability-soap.git
```

Open the terminal in this directory and run:

```
DOCKER_BUILDKIT=1 sudo docker build --no-cache --progress=plain --tag soapint .
$ docker-compose up -d
```

## How to use interoperability-soap

Open the [production](https://interoperability-soap.demo.community.intersystems.com/csp/user/EnsPortal.ProductionConfig.zen?PRODUCTION=dc.Demo.Production) and start it if it is not running.
I use Postman to send a request to http://abc.xx.yy.zzz:57700/soapapp/pricelookup.
