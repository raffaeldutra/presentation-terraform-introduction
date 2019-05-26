## EC2 (Elastic Cloud Computing)

No exemplo abaixo será criado os seguintes recursos:

* Máquina Virtual.
* Grupos de segurança para portas definidas no código.

Arquivo [ec2.tf](/aws/clients/example-company/ec2.tf)

Executando em binário.

```
terraform plan -target=aws_instance.ec2_machine
```

Executando em Docker.

```
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
raffaeldutra/docker-terraform:v0.12.0 \
terraform plan -target=aws_instance.ec2_machine
```

A saída será a seguinte:

```
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

data.aws_ami.ubuntu_server: Refreshing state...
aws_security_group.example_company: Refreshing state... [id=sg-0e0127260d6eacef2]

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.ec2_machine will be created
  + resource "aws_instance" "ec2_machine" {
      + ami                          = "ami-024a64a6685d05041"
      + arn                          = (known after apply)
      + associate_public_ip_address  = (known after apply)
      + availability_zone            = (known after apply)
      + cpu_core_count               = (known after apply)
      + cpu_threads_per_core         = (known after apply)
      + get_password_data            = false
      + host_id                      = (known after apply)
      + id                           = (known after apply)
      + instance_state               = (known after apply)
      + instance_type                = "t2.micro"
      + ipv6_address_count           = (known after apply)
      + ipv6_addresses               = (known after apply)
      + key_name                     = "example-company"
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = [
          + "example-company-sg",
        ]
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "ClientName"  = "Example Company"
          + "Environment" = "Production"
          + "Name"        = "App Instance"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + ephemeral_block_device {
          + device_name  = (known after apply)
          + no_device    = (known after apply)
          + virtual_name = (known after apply)
        }

      + network_interface {
          + delete_on_termination = (known after apply)
          + device_index          = (known after apply)
          + network_interface_id  = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = (known after apply)
          + iops                  = (known after apply)
          + volume_id             = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

Após verificar a saída, aplique os recursos.

Em caso de utilizar binário

```
terraform apply -target=aws_instance.ec2_machine -auto-approve
```

```
docker run --rm \
-v $(pwd):/terraform \
-v $(pwd)/modules:/terraform/modules \
-v ${HOME}/.aws:/root/.aws \
raffaeldutra/docker-terraform:v0.12.0 \
terraform apply -target=aws_instance.ec2_machine -auto-approve
```

A saída será a seguinte:

```
data.aws_ami.ubuntu_server: Refreshing state...
aws_security_group.example_company: Refreshing state... [id=sg-0e0127260d6eacef2]
aws_instance.ec2_machine: Creating...
aws_instance.ec2_machine: Still creating... [10s elapsed]
aws_instance.ec2_machine: Still creating... [20s elapsed]
aws_instance.ec2_machine: Still creating... [30s elapsed]
aws_instance.ec2_machine: Still creating... [40s elapsed]
aws_instance.ec2_machine: Creation complete after 41s [id=i-09cff1baeabe1ce57]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

aws_instance_ip = 54.83.121.200
aws_instance_public_dns = ec2-54-83-121-200.compute-1.amazonaws.com
key_name = example-company
private_key_filepath = /tmp/ssh/tls_key.pem
```