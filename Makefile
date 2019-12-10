.DEFAULT_GOAL := deploy

COMPONENT_NAME ?= custom-component
DOMAIN_NAME    ?= superhub.io
NAMESPACE      ?= custom-component-namespace

kubectl ?= kubectl --context="$(DOMAIN_NAME)" --namespace="$(NAMESPACE)"

deploy:
	@echo "Implement me"

undeploy:
	@echo "Implement me"
