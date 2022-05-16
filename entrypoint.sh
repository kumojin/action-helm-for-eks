#!/bin/bash
set -e

aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$AWS_REGION" --kubeconfig ~/.kube/config

# Github Action will change the $HOME env var and the plugins are inside the $HOME directory
export HELM_PLUGINS=/root/.local/share/helm/plugins
helm "$@"