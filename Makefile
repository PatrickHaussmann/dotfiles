.PHONY: help
help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) |  awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

optional: ## install optional programms
	sudo apt install -y pv fzf nano

update: ## update and upgrade
	sudo apt update && sudo apt full-upgrade -y
	sudo apt upgrade -y
	sudo apt autoremove -y

install: ## install programms
	sudo apt install -y curl git htop vim mosh wget tmux clang-format jq fd-find

