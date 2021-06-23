global:
	echo "IAM"
	cd env/non-prod/global/iam/service-accounts; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve	
	
	echo "PubSub"
	cd env/non-prod/global/pub-sub; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
regional:
	echo "GCS Bucket"
	cd env/non-prod/regions/asia-southeast1/gcs; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
	echo "Networking"
	cd env/non-prod/regions/asia-southeast1/networking/vpc_subnets; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve	

	cd env/non-prod/regions/asia-southeast1/networking/firewall; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve

	cd env/non-prod/regions/asia-southeast1/networking/nat-gateway; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
	echo "Private GKE Cluster"
	cd env/non-prod/regions/asia-southeast1/gke; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
	echo "LoadBalancer"
	cd env/non-prod/regions/asia-southeast1/loadbalancer; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	

# Separate sections for different global resources
iam: 
    echo "IAM"
	cd env/non-prod/global/iam/service-accounts; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve	
	
pubsub:	
	echo "PubSub"
	cd env/non-prod/global/pub-sub; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
# Separate sections for different regional resources 
gcs:	
	echo "GCS Bucket"
	cd env/non-prod/regions/asia-southeast1/gcs; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve
	
networking:	
	echo "Networking"
	cd env/non-prod/regions/asia-southeast1/networking/vpc_subnets; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve	

	cd env/non-prod/regions/asia-southeast1/networking/firewall; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve

	cd env/non-prod/regions/asia-southeast1/networking/nat-gateway; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve

gke:
    echo "Private GKE Cluster"
	cd env/non-prod/regions/asia-southeast1/gke; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve	
	
loadbalancer:	
	echo "LoadBalancer"
	cd env/non-prod/regions/asia-southeast1/loadbalancer; \
	terraform init && terraform apply --var-file=terraform.tfvars --auto-approve

	