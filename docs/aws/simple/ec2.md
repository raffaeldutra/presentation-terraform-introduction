# Criando Máquina Virtual com EC2

No exemplo abaixo será criado os seguintes recursos:

* Máquina Virtual.
* Grupos de segurança para portas definidas no código.

Arquivo [ec2.tf](/providers/aws/simple/ec2.tf)

```
resource "aws_instance" "web" {
  ami           = "ami-8eecc9e2"
  instance_type = "t2.micro"


  tags {
    Name        = "Web",
    Application = "Application 1"
  }
}
```

Rode o comando plan para ver a saída da infraestrutura:

```
terraform plan
```

Com o seguinte resultado:

```
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.


------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web will be created
  + resource "aws_instance" "web" {
      + ami                          = "ami-0378588b4ae11ec24"
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
      + key_name                     = (known after apply)
      + network_interface_id         = (known after apply)
      + password_data                = (known after apply)
      + placement_group              = (known after apply)
      + primary_network_interface_id = (known after apply)
      + private_dns                  = (known after apply)
      + private_ip                   = (known after apply)
      + public_dns                   = (known after apply)
      + public_ip                    = (known after apply)
      + security_groups              = (known after apply)
      + source_dest_check            = true
      + subnet_id                    = (known after apply)
      + tags                         = {
          + "Application" = "Application 1"
          + "Name"        = "Web"
        }
      + tenancy                      = (known after apply)
      + volume_tags                  = (known after apply)
      + vpc_security_group_ids       = (known after apply)

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
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
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + kms_key_id            = (known after apply)
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

E aplique o código:

```
aws_instance.web: Creating...
aws_instance.web: Still creating... [10s elapsed]
aws_instance.web: Still creating... [20s elapsed]
aws_instance.web: Still creating... [30s elapsed]
aws_instance.web: Still creating... [40s elapsed]
aws_instance.web: Creation complete after 41s [id=i-0ca3fafdc45dfb31c]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

Destrua com o comando:

```
terraform destroy -auto-approve
```

Com a seguinte saída:

```
aws_instance.web: Refreshing state... [id=i-0ca3fafdc45dfb31c]
aws_instance.web: Destroying... [id=i-0ca3fafdc45dfb31c]
aws_instance.web: Still destroying... [id=i-0ca3fafdc45dfb31c, 10s elapsed]
aws_instance.web: Still destroying... [id=i-0ca3fafdc45dfb31c, 20s elapsed]
aws_instance.web: Destruction complete after 23s

Destroy complete! Resources: 1 destroyed.
```