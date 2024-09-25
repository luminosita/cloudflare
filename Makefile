include common.mk

plan:
	terraform plan -out=cf.tfplan

apply:
	terraform apply cf.tfplan