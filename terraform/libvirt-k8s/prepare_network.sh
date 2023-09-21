#!/bin/bash
#
sudo brctl addbr br-tf-k8s
sudo ip addr add 10.95.10.254/24 dev br-tf-k8s
sudo ip link set br-tf-k8s up
