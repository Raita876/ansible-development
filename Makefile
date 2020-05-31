UBUNTU_BOX = ubuntu/bionic64


.PHONY: add
add: ## Add Box
	vagrant box add $(UBUNTU_BOX)

.PHONY: up
up: ## Start virtual machine
	vagrant up

.PHONY: down
down: ## Stop virtual machine
	vagrant halt

.PHONY: reload
reload: ## Restart virtual machine
	vagrant reload

.PHONY: provision
provision: ## Provision by playbook
	vagrant provision

.PHONY: config
config: ## Setting ssh config of virtual machine
	vagrant ssh-config --host=ubuntu
	vagrant ssh-config --host=ubuntu　>> ~/.ssh/config
