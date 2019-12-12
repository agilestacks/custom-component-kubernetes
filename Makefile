.DEFAULT_GOAL := deploy

COMPONENT_NAME ?= custom-component
DOMAIN_NAME    ?= superhub.io
NAMESPACE      ?= custom-component-namespace

kubectl ?= kubectl --context="$(DOMAIN_NAME)"

deploy:
	-$(kubectl) create namespace $(NAMESPACE)
	$(kubectl) --namespace $(NAMESPACE) apply -f kubernetes.yaml

undeploy:
	$(kubectl) --namespace $(NAMESPACE) delete -f kubernetes.yaml
