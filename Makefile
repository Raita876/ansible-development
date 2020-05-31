UBUNTU_BOX = ubuntu/bionic64

.PHONY: add
add:
	vagrant box add $(UBUNTU_BOX)

.PHONY: up
up:
	vagrant up

.PHONY: config
config:
	vagrant ssh-config --host=ubuntu
	vagrant ssh-config --host=ubuntu　>> ~/.ssh/config

.PHONY: reload
reload:
	vagrant reload

.PHONY: provision
provision:
	vagrant provision
