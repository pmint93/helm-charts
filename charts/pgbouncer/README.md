# PgBouncer

A helm chart for [PgBouncer](https://www.pgbouncer.org/) - the lightweight connection pooler for PostgreSQL

## Introduction

This chart bootstraps a [PgBouncer](https://www.pgbouncer.org/) deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Get Repo Info

```bash
helm repo add pmint93 https://pmint93.github.io/helm-charts
helm repo update
```

See [helm repo](https://helm.sh/docs/helm/helm_repo/) for command documentation.

## Installing the Chart

```bash
helm install [RELEASE_NAME] pmint93/pgbouncer
```

## Uninstalling the Chart

```bash
helm uninstall [RELEASE_NAME]
```

## Configuration

The following table lists the configurable parameters of the chart and their default values.

| Key                                       | Type      | Default                                                           | Description                                                                                           |
|-------------------------------------------|-----------|-------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| replicaCount                              | int       | `1`                                                               | Desired number of pods                                                                                |
| databases                                 | object    | `{}`                                                              | List of databases that PgBouncer will route to                                                        |
| users                                     | list      | `[]`                                                              | List of users and specific settings                                                                   |
| connectionLimits.default_pool_size        | int       | `20`                                                              | Number of server connections per user/database pair                                                   |
| connectionLimits.max_client_conn          | int       | `200`                                                             | Maximum number of client connections allowed                                                          |
| connectionLimits.min_pool_size            | int       | `15`                                                              | Add more server connections to pool if below this number                                              |
| connectionLimits.reserve_pool_size        | int       | `25`                                                              | How many additional connections to allow to a pool                                                    |
| connectionLimits.reserve_pool_timeout     | int       | `5`                                                               | If a client has not been serviced in this time, use additional connections from the reserve pool      |
| logging.log_connections                   | int       | `1`                                                               | Log successful logins                                                                                 |
| logging.log_disconnections                | int       | `1`                                                               | Log disconnections with reasons                                                                       |
| logging.log_pooler_errors                 | int       | `1`                                                               | Log error messages the pooler sends to clients                                                        |
| logging.log_stats                         | int       | `0`                                                               | Write aggregated statistics into the log, every stats_period                                          |
| logging.stats_period                      | int       | `60`                                                              | Set how often aggregated statistics are written to the log                                            |
| logging.verbose                           | int       | `0`                                                               | Verbosity level                                                                                       |
| settings.auth_query                       | string    | `"SELECT usename, passwd FROM pg_shadow WHERE usename=$1"`        | Query to load user’s password from database                                                           |
| settings.auth_type                        | string    | `"md5"`                                                           | How to authenticate users: cert, md5, scram-sha-256, plain, plain, any, hba or pam                    |
| settings.auth_user                        | string    | `nil`                                                             | If set, then any user not specified in `users` will be queried through the auth_query                 |
| settings.pool_mode                        | string    | `"session"`                                                       | Set the pool mode to be used for all connections                                                      |
| extraSettings                             | object    | `{"ignore_startup_parameters":"extra_float_digits"}`              | Extra settings for section [pgbouncer] in pgbouncer.ini                                               |
| image.command                             | list      | `[]`                                                              | Override the image's command                                                                          |
| image.args                                | list      | `["/etc/pgbouncer/pgbouncer.ini"]`                                | Container image args                                                                                  |
| image.pullPolicy                          | string    | `"IfNotPresent"`                                                  | Container image pull policy                                                                           |
| image.repository                          | string    | `"hyperized/pgbouncer"`                                           | Container image repository                                                                            |
| image.tag                                 | string    | chart's appVersion                                                | Container image tag                                                                                   |
| imagePullSecrets                          | list      | `[]`                                                              | Container image pull secrets                                                                          |
| nameOverride                              | string    | `""`                                                              | Override the name of release                                                                          |
| fullnameOverride                          | string    | `""`                                                              | Override the fullname of release                                                                      |
| podAnnotations                            | object    | `{}`                                                              | Pod's annotations                                                                                     |
| podSecurityContext                        | object    | `{}`                                                              | Security context settings for the pod                                                                 |
| securityContext                           | object    | `{}`                                                              | Security context settings for the container                                                           |
| updateStrategy                            | object    | `{"type":"RollingUpdate","rollingUpdate":{"maxUnavailable":0}}`   | The deployment update strategy settings                                                               |
| service.port                              | int       | `5432`                                                            | Service external port                                                                                 |
| service.type                              | string    | `"ClusterIP"`                                                     | ClusterIP, NodePort, or LoadBalancer                                                                  |
| resources                                 | object    | `{}`                                                              | Server resource requests and limits                                                                   |
| nodeSelector                              | object    | `{}`                                                              | Node labels for pod assignment                                                                        |
| tolerations                               | list      | `[]`                                                              | Toleration labels for pod assignment                                                                  |
| affinity                                  | object    | `{}`                                                              | Affinity settings for pod assignment                                                                  |

To better understand PgBouncer configuration, please refer to [this document](https://www.pgbouncer.org/config.html)
