resource "aws_transfer_server" "example" {
  endpoint_type = "VPC"

  endpoint_details {
    subnet_ids =    [var.subnet_id_1, var.subnet_id_2]
    vpc_id     =    var.vpc_id
  }

  protocols   = ["SFTP"]
  security_policy_name = "TransferSecurityPolicy-2020-06"
  host_key = ""
  logging_role = ""
  pre_authentication_login_banner = ""
  post_authentication_login_banner = ""
  tags = {
    Name = "Example"
  }
}

