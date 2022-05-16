#!/bin/bash
set -e

aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$AWS_REGION" --kubeconfig ~/.kube/config

helm "$@"
