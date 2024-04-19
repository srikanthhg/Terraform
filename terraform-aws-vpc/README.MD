### AWS VPC Module

This module creates following resources. We are using HA, we are getting 2 AZ automatically.
* VPC
* Internet gateway with VPC association
* 2 public subnets in 1a and 1b
* 2 private subnets in 1a and 1b
* 2 database subnets in 1a and 1b
* Elastic IP
* NAT Gateway in 1a public subnet
* public route table
* private route table
* database route table
* Subnets and route table association
* VPC peering if user requests
* adding the peering route in default vpc, if user dont provide acceptor VPC explicitly.
* Adding the peering routes in public, private and database route table

### Inputs

* project_name (Required) - your project name
* environment (Required) - which environment you are working in
* vpc_cidr (Optional) - Default value is 10.0.0.0/16, user can override
* enable_dns_hostnames (Optional) - Default value is true
* common_tags (Optional) - Better to provide
* vpc_tags (Optional) - Default value is empty. type is map
* igw_tags (Optional) - Default value is empty. type is map
* public_subnets_cidr (Required) - User must provide 2 valid public subnets CIDR
* public_subnets_tags (Optional) - Default value is empty. type is map
* private_subnets_cidr (Required) - User must provide 2 valid private subnets CIDR
* private_subnets_tags (Optional) - Default value is empty. type is map
* database_subnets_cidr (Required) - User must provide 2 valid database subnets CIDR
* database_subnets_tags (Optional) - Default value is empty. type is map
* nat_gateway_tags (Optional) - Default value is empty. type is map
* public_route_table_tags (Optional) - Default value is empty. type is map
* private_route_table_tags (Optional) - Default value is empty. type is map
* database_route_table_tags (Optional) - Default value is empty. type is map
* is_peering_required (Optional) - default value is false
* acceptor_vpc_id (Optional) - default value is default VPC ID
* vpc_peering_tags (Optional) - Default value is empty. type is map

### Outputs

* vpc_id - VPC ID created
* public_subnet_ids - 2 public subnet ID created
* private_subnet_ids - 2 private subnet ID created
* database_subnet_ids - 2 database subnet ID created