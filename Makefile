TERRAFORM_VERSION ?= "1.4.4"
TERRAGRUNT_VERSION ?= "0.45.2"

UNAME := $(shell uname)
ARCH := $(shell uname -m)
SHELL := /bin/bash


ifeq ($(UNAME), Linux)
KERNAL := "linux"
endif
ifeq ($(UNAME), Darwin)
KERNAL := "darwin"
BREWLIST := $(shell brew list --formula)
endif


setup: tfenv-install-from-brew terraform-set-version terragrunt-install-from-source

aws-vault-install-from-brew:
	@echo "==> Installing aws-vault from brew..."
	@if [[ ! "$(BREWLIST)" =~ "aws-vault" ]]; then brew install aws-vault; else echo "Already installed."; fi
	@echo "==> Done."

tfenv-install-from-brew:
	@echo "==> Installing tfenv from brew..."
	@if [[ ! "$(BREWLIST)" =~ "tfenv" ]]; then brew install --build-from-source tfenv; else echo "Already installed."; fi
	@echo "==> Done."

terraform-set-version:
	@echo "Checking for tfenv..."
	@if [[ ! "$(BREWLIST)" =~ "tfenv" ]]; then brew install --build-from-source tfenv; fi
	@echo "==> Checking for terraform..."
	@if [[ "$(shell tfenv list)" =~ "${TERRAFORM_VERSION}" ]]; then \
		echo "Terraform v${TERRAFORM_VERSION} already installed. Switching version..."; \
		tfenv use ${TERRAFORM_VERSION}; \
	else \
		echo "Current terraform v$(shell terraform --version) does not match v${TERRAFORM_VERSION}. Installing new version..."; \
		tfenv install ${TERRAFORM_VERSION}; \
		tfenv use ${TERRAFORM_VERSION}; \
	fi
	@echo "==> Done."

#TODO: fix when brew allows installation of specific version of Terragrunt
# terragrunt-install-from-brew:
# 	@echo "==> Checking for Terragrunt"
# 	@if [[ ! "$(BREWLIST)" =~ "terragrunt" ]]; then brew install --build-from-source terragrunt@$(TERRAGRUNT_VERSION); else echo "Already installed"; fi
# 	@echo "==> Done."

terragrunt-install-from-source:
	@echo "==> Installing Terragrunt from source..."
	@if [ ! -f "/usr/local/bin/terragrunt" ]; then \
		echo "==> Terragrunt binary not found"; \
		make _terragrunt-install-from-source; \
	else \
		if [[ "$(shell terragrunt --version)" =~ "${TERRAGRUNT_VERSION}" ]]; then \
			echo "==> Terragrunt v${TERRAGRUNT_VERSION} already installed. Nothing to do."; \
		else \
			echo "Current Terragrunt $(shell terragrunt --version) does not match v${TERRAGRUNT_VERSION}. Installing new version..."; \
			make _terragrunt-install-from-source; \
		fi \
	fi
	@echo "==> Done."

_terragrunt-install-from-source:
	echo "==> https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_${KERNAL}_${ARCH}"; \
	curl -L https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_${KERNAL}_${ARCH} --output /tmp/terragrunt; \
	chmod +x /tmp/terragrunt; \
	sudo mv /tmp/terragrunt /usr/local/bin; \


help:
	@echo 'Makefile targets:'
	@echo '  setup                           - Installs tfenv, Terraform and Terragrunt.'
	@echo '  tfenv-install-from-brew         - Installs tfenv for managing multiple Terraform versions.'
	@echo '  terraform-set-version           - Installs Terraform version if not already installed and sets the Terraform version using tfenv.'
	@echo '  terragrunt-install-from-source  - Installs Terragrunt from source.'

.PHONY: setup tfenv-install-from-brew terraform-set-version terragrunt-install-from-source
.PHONY: help
