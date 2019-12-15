.DEFAULT_GOAL := deploy

COMPONENT_NAME ?= custom-component
DOMAIN_NAME    ?= superhub.io
COMPONENT_NAMESPACE   ?= custom-component-namespace

kubectl ?= kubectl --context="$(DOMAIN_NAME)"

deploy:
	-$(kubectl) create namespace $(COMPONENT_NAMESPACE)
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) apply -f templates/deployment.yaml
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) apply -f templates/service.yaml
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) apply -f templates/ingress.yaml

undeploy:
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) delete -f templates/ingress.yaml
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) delete -f templates/service.yaml
	$(kubectl) --namespace $(COMPONENT_NAMESPACE) delete -f templates/deployment.yaml

