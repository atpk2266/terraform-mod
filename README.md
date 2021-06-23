# Ropso IAC Repo

## Structure
```
├──env
    ├──non-prod
        ├── global
            ├── iam
                ├── service_accounts
            ├── pubsub	
        ├── regions
            ├── asia-southeast1
            ├── gcs
		    ├── gke
		    ├── loadbalancer
		    ├── networking
		       ├── firewall
		       ├── nat_gateway
		       ├── vpc_subnets
├── modules
├── Makefile
├── README.md            
```

## Sequence in which the resources to be provisioned
Following is the sequence in which we will provision the resources.

1. IAM
2. PubSub
3. GCS Bucket
4. VPC Subnets
5. Firewall Rules
6. NAT Gateway
7. GKE Cluster
8. LoadBalancer

## Steps to provision resources

There is a `Makefile` in the root directory that contains the terraform commands to provision the resources.

**Description of the Makefile**
- The `Makefile` contains 2 sections. One for `global` and another for `regional`resources.

- `global` section will provision following resources.
```
1. IAM
2. PubSub
```

- `regional` section will provision following resources.
```
3. GCS Bucket
4. VPC Subnets
5. Firewall Rules
6. NAT Gateway
7. GKE Cluster
8. LoadBalancer
9. PubSub

```
### Step 1: Install make
```
$ sudo apt-get update
$ sudo apt-get install -y make
```

### Step 2: Execute the below command to provision the global resources.

```
$ make global
```

### Step 3: Execute the below command to provision the regional resources.

```
$ make regional
```

## The terraform resources will consists of following structure.

```
├── main.tf                   // The primary entrypoint for terraform resources.
├── variables.tf              // It contain the declarations for variables.
├── outputs.tf                // It contain the declarations for outputs.
├── providers.tf              // To specify infrastructure vendors.
├── versions.tf               // To specify terraform versions.
├── backend.tf                // To create terraform backend state configuration.
├── terraform.tfvars          // The file to pass the terraform variables values.
```
# terraform-modified
