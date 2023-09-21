#!/usr/bin/env python

import yaml

controller_ip = "10.202.254.1"

with open("playbooks/vars/containers.yaml") as f:
   obj=yaml.load(f, Loader=yaml.FullLoader)

print("[controller_container]")
for c in obj['controller_container']:
   print("%s ansible_user=fiware type=controller" % (c))
print()

print("[worker_containers]")
for c in obj['worker_containers']:
   print("%s ansible_user=fiware type=worker" % (c))
print()

print("[all:children]")
print('controller_container')
print('worker_containers')
print()
print("[all:vars]")
print("controller_ip=%s" % controller_ip)
print("nfs-server=%s" % controller_ip)
