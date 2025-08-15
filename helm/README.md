# Helm
Helm is the defacto standard for packaging and distributing kubernetes applications.
It provides a templating mechanism to define, install, and upgrade even the most complex Kubernetes applications. Helm Chart is a collection of files that describe a related set of Kubernetes resources.

## The Big Concept
**Chart** - is a Helm package. It contains all of the resource definitions necessary to run an application, tool, or service inside of a Kubernetes cluster. Think of it like the Kubernetes equivalent of a Homebrew formula, an Apt dpkg, or a Yum RPM file.

**Repository** - is a place where charts can be stored and shared. Helm can work with remote chart repositories (like a GitHub repository) as well as local chart directories.

**Release** - is a specific instance of a chart running in a Kubernetes cluster. A chart can be installed multiple times, creating multiple releases.

- Helm can now be defined as a tool for managing Kubernetes applications through the use of Helm charts.

## Components of a Helm Chart
1. **Chart.yaml**: This file contains metadata about the chart, such as its name, version, and dependencies.
2. **values.yaml**: This file defines the default configuration values for the chart. Users can override these values during installation or upgrades.
3. **templates/**: This directory contains the Kubernetes manifest templates that will be rendered using the values from `values.yaml`.
4. **charts/**: This directory can contain other Helm charts that are dependencies of the main chart.

### Helm CLI
```bash
# Install a chart
helm install my-release my-chart/

# Upgrade a release
helm upgrade my-release my-chart/

# Rollback a release
helm rollback my-release 1

# Uninstall a release
helm uninstall my-release

# Create a new chart
helm create my-chart

# Package a chart
helm package my-chart

# search for a chart
helm search my-chart

# list all releases
helm list
```