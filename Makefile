UBUNTU_BOX = ubuntu/bionic64

.PHONY: add
add:
	vagrant box add $(UBUNTU_BOX)

.PHONY: up
up:
	vagrant up

.PHONY: down
down:
	vagrant halt

.PHONY: reload
reload:
	vagrant reload

.PHONY: provision
provision:
	vagrant provision

.PHONY: config
config:
	vagrant ssh-config --host=ubuntu
	vagrant ssh-config --host=ubuntu　>> ~/.ssh/config
