UBUNTU_BOX = ubuntu/bionic64
HOST = development

.PHONY: add
add:
	vagrant box add $(UBUNTU_BOX)

.PHONY: up
up:
	vagrant up

.PHONY: config
config:
	vagrant ssh-config

.PHONY: ping
ping:
	ansible -i ./hosts $(HOST) -m ping

.PHONY: playbook
playbook:
	ansible-playbook -i ./hosts -v ./setup.yaml
