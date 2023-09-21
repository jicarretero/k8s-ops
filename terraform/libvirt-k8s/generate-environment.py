#!/usr/bin/python3
#
VM_COUNT=3
VM_CONTROLLERS=1
VM_USER="ubuntu"
VM_GROUP="ubuntu"
VM_HOSTNAME="tfk8scluster"
CONTROLLER_IP="10.95.10.1"
BASE_IP="10.95.10."

def generate_inventory():
    print("[controller_container]")
    for i in range(VM_CONTROLLERS):
        print(f"{VM_HOSTNAME}-{i} ansible_user={VM_USER} type=controller user={VM_USER} group={VM_GROUP}")
    print()

    print("[worker_containers]")
    for i in range(VM_CONTROLLERS,VM_COUNT):
        print(f"{VM_HOSTNAME}-{i} ansible_user={VM_USER} type=worker user={VM_USER} group={VM_GROUP}")

    print(f'''
[all:children]
controller_container
worker_containers

[all:vars]
controller_ip={CONTROLLER_IP}
nfs-server={CONTROLLER_IP}
''')


def generate_local_values():
    for i in range(VM_COUNT):
        octect =  i+11 - VM_CONTROLLERS if i >= VM_CONTROLLERS else i+1 
        print(f"{BASE_IP}{octect}     {VM_HOSTNAME}-{i}")

generate_local_values()
