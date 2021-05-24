.DEFAULT_GOAL := help

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

ANSIBLE_PLAYBOOK := ansible-playbook --ask-vault-pass -i hosts.ini

deploy_sample_project: ssh_add # Deploy sample project
	@${ANSIBLE_PLAYBOOK} playbook.yml

ssh_add:
	@ssh-add
