## Kubernetes Resource Types
This directory contains the definitions of various Kubernetes resource types used in the project. Each resource type is defined in its own YAML file, which can be applied to a Kubernetes cluster using `kubectl apply -f <filename>`.
### Resource Types
- **Namespace**: Defines a namespace for isolating resources within the cluster.
- **Pod**: Represents a single instance of a running process in the cluster.
- **ReplicaSet**: Ensures that a specified number of pod replicas are running at any given time.
- **Deployment**: Manages the deployment of applications, allowing for rolling updates and rollbacks.
- **Service**: Exposes a set of pods as a network service, allowing for load balancing and service discovery.
- **Job**: Represents a one-time task that runs to completion.
- **CronJob**: Similar to a job, but runs on a scheduled basis.
- **DaemonSet**: Ensures that a copy of a pod runs on all (or some) nodes in the cluster.
- **StatefulSet**: Manages stateful applications, ensuring that pods are created in a specific order and maintain their identity.
- **ConfigMap**: Provides a way to inject configuration data into pods.
- **Secret**: Similar to ConfigMap, but used for sensitive information like passwords and tokens.
- **Ingress**: Manages external access to services, typically HTTP.
- **Gateway**: Defines a gateway for managing traffic into the cluster, often used with service meshes.
- **PersistentVolume**: Represents a piece of storage in the cluster that has been provisioned by an administrator.
- **RBAC (Role-Based Access Control)**: Defines permissions for users and service accounts within the cluster.