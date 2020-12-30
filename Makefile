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
	vagrant ssh-config --host=ubuntu | tee -a ~/.ssh/config

.PHONY: local
local: ## Start ansible-playbook to localhost
	ansible-playbook -i localhost, -c local --ask-become-pass ./setup.yaml

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
