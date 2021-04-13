# Metabase

[Metabase](http://metabase.com) is the easy, open source way for everyone in your company to ask questions and learn from data.

## Introduction

This chart bootstraps a [Metabase](https://github.com/metabase/metabase) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.4+

## Get Repo Info

```bash
helm repo add pmint93 https://pmint93.github.io/helm-charts
helm repo update
```

See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation.

## Installing the Chart

```bash
# Helm 3
$ helm install [RELEASE_NAME] pmint93/metabase

# Helm 2
$ helm install --name [RELEASE_NAME] pmint93/metabase
```

The command deploys Metabase on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

```bash
# Helm 3
$ helm uninstall [RELEASE_NAME]

# Helm 2
# helm delete --purge [RELEASE_NAME]
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the Metabase chart and their default values.

| Parameter                        | Description                                                 | Default           |
| -------------------------------  | ----------------------------------------------------------- | ----------------- |
| replicaCount                     | desired number of controller pods                           | 1                 |
| podAnnotations                   | controller pods annotations                                 | {}                |
| podLabels                        | extra pods labels                                           | {}                |
| image.repository                 | controller container image repository                       | metabase/metabase |
| image.tag                        | controller container image tag                              | v0.36.3           |
| image.command                    | controller container image command                          | []                |
| image.pullPolicy                 | controller container image pull policy                      | IfNotPresent      |
| fullnameOverride                 | String to fully override metabase.fullname template         | null              |
| listen.host                      | Listening on a specific network host                        | 0.0.0.0           |
| listen.port                      | Listening on a specific network port                        | 3000              |
| ssl.enabled                      | Enable SSL to run over HTTPS                                | false             |
| ssl.port                         | SSL port                                                    | null              |
| ssl.keyStore                     | The key store in JKS format                                 | null              |
| ssl.keyStorePassword             | The password for key Store                                  | null              |
| database.type                    | Backend database type                                       | h2                |
| database.encryptionKey           | Secret key for encrypt sensitive information into database  | null              |
| database.connectionURI           | Database connection URI (alternative to the below settings) | null              |
| database.host                    | Database host                                               | null              |
| database.port                    | Database port                                               | null              |
| database.dbname                  | Database name                                               | null              |
| database.username                | Database username                                           | null              |
| database.password                | Database password                                           | null              |
| database.existingSecret          | Exising secret for database credentials                     | null              |
| database.existingSecretUsernameKey | Username key for exising secret                           | null              |
| database.existingSecretPasswordKey | Password key for exising secret                           | null              |
| database.existingSecretConnectionURIKey | ConnectionURI key for exising secret                 | null              |
| password.complexity              | Complexity requirement for Metabase account's password      | normal            |
| password.length                  | Minimum length required for Metabase account's password     | 6                 |
| timeZone                         | Service time zone                                           | UTC               |
| emojiLogging                     | Get a funny emoji in service log                            | true              |
| javaOpts                         | JVM options                                                 | null              |
| pluginsDirectory                 | A directory with Metabase plugins                           | null              |
| livenessProbe.initialDelaySeconds | Delay before liveness probe is initiated                   | 120               |
| livenessProbe.timeoutSeconds     | When the probe times out                                    | 30                |
| livenessProbe.failureThreshold   | Minimum consecutive failures for the probe                  | 6                 |
| readinessProbe.initialDelaySeconds | Delay before readiness probe is initiated                 | 30                |
| readinessProbe.timeoutSeconds    | When the probe times out                                    | 3                 |
| readinessProbe.periodSeconds     | How often to perform the probe                              | 5                 |
| service.type                     | ClusterIP, NodePort, or LoadBalancer                        | ClusterIP         |
| service.loadBalancerSourceRanges | Array of Source Ranges                                      | null              |
| service.externalPort             | Service external port                                       | 80                |
| service.internalPort             | Service internal port, should be the same as `listen.port`  | 3000              |
| service.nodePort                 | Service node port                                           | null              |
| service.annotations              | Service annotations                                         | {}                |
| serviceAccount.create            | Specifies whether a service account should be created       | false             |
| serviceAccount.annotations       | Annotations to add to the service account                   | {}                |
| serviceAccount.name              | The name of the service account to use                      | null              |
| ingress.enabled                  | Enable ingress controller resource                          | false             |
| ingress.hosts                    | Ingress resource hostnames                                  | null              |
| ingress.path                     | Ingress path                                                | /                 |
| ingress.labels                   | Ingress labels configuration                                | null              |
| ingress.annotations              | Ingress annotations configuration                           | {}                |
| ingress.tls                      | Ingress TLS configuration                                   | null              |
| log4jProperties                  | Custom `log4j.properties` file                              | null              |
| resources                        | Server resource requests and limits                         | {}                |
| nodeSelector                     | Node labels for pod assignment                              | {}                |
| tolerations                      | Toleration labels for pod assignment                        | []                |
| affinity                         | Affinity settings for pod assignment                        | {}                |
| jetty.maxThreads                 | Jetty max number of threads                                 | null              |
| jetty.minThreads                 | Jetty min number of threads                                 | null              |
| jetty.maxQueued                  | Jetty max queue size                                        | null              |
| jetty.maxIdleTime                | Jetty max idle time                                         | null              |
| siteUrl                          | Base URL, useful for serving behind a reverse proxy         | null              |
| session.maxSessionAge            | Session expiration defined in minutes                       | 20160             |
| session.sessionCookies           | When browser is closed, user login session will expire      | null              |

The above parameters map to the env variables defined in [metabase](http://github.com/metabase/metabase). For more information please refer to the [metabase documentations](http://www.metabase.com/docs/v0.36.3/).
