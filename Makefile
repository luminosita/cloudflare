include common.mk

plan:
	tofu plan -out=cf.tfplan

apply:
	tofu apply cf.tfplan 