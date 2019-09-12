# VPC (Virtual Private Cloud)

O primeiro passo em uma Infraestrutura da AWS seria pela VPC (Virtual Private Cloud).

No exemplo abaixo será criado os seguintes recursos:

* VPC.
* Duas subredes públicas.
* Internet Gateway
* Tabelas de roteamento para subredes.

Arquivo [vpc.tf](/providers/aws/with-modulesy/vpc.tf)

Executando em binário.

```
terraform plan -target=vpc
```

A saída será a seguinte:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vpc.aws_internet_gateway.gw will be created
  + resource "aws_internet_gateway" "gw" {
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "igw-production"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "rt-public-production-us-east-1a"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[1] will be created
  + resource "aws_route_table" "public" {
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                = "0.0.0.0/0"
              + egress_only_gateway_id    = ""
              + gateway_id                = (known after apply)
              + instance_id               = ""
              + ipv6_cidr_block           = ""
              + nat_gateway_id            = ""
              + network_interface_id      = ""
              + transit_gateway_id        = ""
              + vpc_peering_connection_id = ""
            },
        ]
      + tags             = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "rt-public-production-us-east-1b"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1a"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.1.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "public-production-us-east-1a"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                             = (known after apply)
      + assign_ipv6_address_on_creation = false
      + availability_zone               = "us-east-1b"
      + availability_zone_id            = (known after apply)
      + cidr_block                      = "172.16.3.0/24"
      + id                              = (known after apply)
      + ipv6_cidr_block                 = (known after apply)
      + ipv6_cidr_block_association_id  = (known after apply)
      + map_public_ip_on_launch         = true
      + owner_id                        = (known after apply)
      + tags                            = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "public-production-us-east-1b"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
      + vpc_id                          = (known after apply)
    }

  # module.vpc.aws_vpc.vpc will be created
  + resource "aws_vpc" "vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "172.16.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = true
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags                             = {
          + "AccountName" = "example-company"
          + "ClientName"  = "example-company"
          + "Environment" = "production"
          + "Name"        = "production"
          + "ProjectName" = "example-company-demonstration"
          + "Region"      = "us-east-1"
        }
    }

Plan: 8 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Após verificar a saída, aplique os recursos.

Em caso de utilizar binário

```
terraform apply -auto-approve
```

A saída será a seguinte:

```
module.vpc.aws_vpc.vpc: Creating...
module.vpc.aws_vpc.vpc: Still creating... [10s elapsed]
module.vpc.aws_vpc.vpc: Creation complete after 12s [id=vpc-0f5c3be4e7023f4fc]
module.vpc.aws_internet_gateway.gw: Creating...
module.vpc.aws_subnet.public[0]: Creating...
module.vpc.aws_subnet.public[1]: Creating...
module.vpc.aws_subnet.public[1]: Creation complete after 5s [id=subnet-02eccc2f70aa1dbcf]
module.vpc.aws_subnet.public[0]: Creation complete after 5s [id=subnet-0b8f164ff4f1a00ff]
module.vpc.aws_internet_gateway.gw: Creation complete after 5s [id=igw-0dec3186585f17dc7]
module.vpc.aws_route_table.public[1]: Creating...
module.vpc.aws_route_table.public[0]: Creating...
module.vpc.aws_route_table.public[1]: Creation complete after 4s [id=rtb-01ec8691eb263484a]
module.vpc.aws_route_table.public[0]: Creation complete after 4s [id=rtb-0187c84359b186032]
module.vpc.aws_route_table_association.public[0]: Creating...
module.vpc.aws_route_table_association.public[1]: Creating...
module.vpc.aws_route_table_association.public[1]: Creation complete after 0s [id=rtbassoc-0f94c83bfe0bb7940]
module.vpc.aws_route_table_association.public[0]: Creation complete after 1s [id=rtbassoc-006f09c4b5c795460]

Apply complete! Resources: 8 added, 0 changed, 0 destroyed.
```

[Criando chaves SSH](ssh.md)