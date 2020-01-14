# PgPool
This is a barebones Alpine Linux based PgPool image. The purpose of the image is not be a universal PgPool image but instead one that can be used to implement a single endpoint for postgres installations with streamining replication that expose a seperate read-only endpoint. It is assumed that the read-replica endpoint might be backed by multiple instances and that the endpoint offers its own load balancing.

The following environment variables have to be provided to the container:

| Env Var | Description |
| ------------- | ------------- |
| MASTER_HOSTNAME | Hostname or ip-address of the master endpoint |
| MASTER_PORT | Port at which the master service is available on its endpoint |
| MASTER_WEIGHT | Read weighting to apply to the master endpoint |
| REPLICA_HOSTNAME | Hostname or ip-address of the replica endpoint |
| REPLICA_PORT | Port at which the replica service is available on its endpoint |
| REPLICA_WEIGHT | Read weighting to apply to the replica endpoint |
| USERNAME | The username used to connect to the postgres service |
| PASSWORD | The password for the user used to connect to the postgres service |

By providing a greater weight to the replica service, PgPool will direct more read requests to the replica endpoint. A logical value to apply here would be the amount of instances that back the service.
