### This directory contains an example from the first chapter of the book "Terraform Up and Running" by Yavgeniy Brikman

## How to install terraform : 

- The information about installing terraform can be found on the HashiCorp website 
[here](https://learn.hashicorp.com/terraform/getting-started/install.html)

## How to use it :

- In a directory of your choice, clone the github repository :
    ```
    git clone https://github.com/martinhristov90/UpAndRunningTF/Chapter01
    ```

- Change into the directory :
    ```
    cd UpAndRunningTF
    ```

- Run `terraform init` to download the needed AWS provider.

- Run `terraform plan` to see what changes are going to be performed :
```
  + aws_instance.app
      id:                           <computed>
      ami:                          "ami-40d28157"
      arn:                          <computed>
      associate_public_ip_address:  <computed>
      availability_zone:            "us-east-1a"
      cpu_core_count:               <computed>
      cpu_threads_per_core:         <computed>
      ebs_block_device.#:           <computed>
      ephemeral_block_device.#:     <computed>
      get_password_data:            "false"
      host_id:                      <computed>
      instance_state:               <computed>
      instance_type:                "t2.micro"
      ipv6_address_count:           <computed>
      ipv6_addresses.#:             <computed>
      key_name:                     <computed>
      network_interface.#:          <computed>
      network_interface_id:         <computed>
      password_data:                <computed>
      placement_group:              <computed>
      primary_network_interface_id: <computed>
      private_dns:                  <computed>
      private_ip:                   <computed>
      public_dns:                   <computed>
      public_ip:                    <computed>
      root_block_device.#:          <computed>
      security_groups.#:            <computed>
      source_dest_check:            "true"
      subnet_id:                    <computed>
      tenancy:                      <computed>
      user_data:                    "5f0133e03a8ff26e8a04dc6131faca65099769a3"
      volume_tags.%:                <computed>
      vpc_security_group_ids.#:     <computed>


Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.
```

- Run `terraform apply` to actually apply the changes.

