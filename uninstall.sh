#!/usr/bin/env bash

namespace="${1:-"monitoring"}"
release="${2:-prometheus-operator}"

helm uninstall "${release}"

kubectl delete secret -n "${namespace}" etcd-client --ignore-not-found

kubectl delete --recursive --filename ./manifests/prometheus-operator --ignore-not-found

kubectl delete --recursive --filename ./templates --ignore-not-found

kubectl delete pvc prometheus-monitoring-prometheus-oper-prometheus-db-prometheus-monitoring-prometheus-oper-prometheus-0
