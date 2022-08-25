resource "aws_s3_bucket" "a" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

resource "aws_transfer_server" "company_sftp" {
  identity_provider_type = "SERVICE_MANAGED"
  endpoint_type = "VPC"
  host_key = var.host_key

  endpoint_details {
    address_allocation_ids = [aws_eip.acme_1.id, aws_eip.acme_2.id]
    # subnet_ids             = [aws_subnet.example.id]
    subnet_ids             = [var.subnet_id_1, var.subnet_id_2]
    # vpc_id                 = aws_vpc.example.id
    vpc_id                 = var.vpc_id
    security_group_ids     = [aws_security_group.allow_sftp.id]
  }




  tags = {
    NAME = "company_sftp"
  }
}

resource "aws_iam_role" "acme" {
  name = "acme-transfer-user-iam-role"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
        "Effect": "Allow",
        "Principal": {
            "Service": "transfer.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
        }
    ]
}
EOF
}

resource "aws_iam_role_policy" "foo" {
  name = "acme-transfer-user-iam-policy"
  role = aws_iam_role.acme.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowFullAccesstoS3",
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY
}

resource "aws_transfer_user" "bob" {
  server_id = aws_transfer_server.company_sftp.id
  user_name = "acme_user"
  role      = aws_iam_role.acme.arn

  home_directory_type = "PATH"
}

resource "aws_transfer_ssh_key" "bob_key" {
  server_id = aws_transfer_server.company_sftp.id
  user_name = aws_transfer_user.bob.user_name
  body      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDY1t2mUnihfwqJa3vgFJzBOtA0pWsFmfw9Twc1GvR55R4EsZ2CxGPE/Ys/v4mBgUy/11jA0MnF3AfR2QOCN9DFhLAvw+eUyIVwQzIxJTSvJfbDG9dNYeq6GxKFiwBtSqm3k51RcmlRvea3zGoJsEqsys9taKhoawjIdCs0GldhZWQVCkif0Qg6WmMZYXn6abB3WC/IHWt0KqNZHZUODSY9Y+7RV4ODT/8NMJrL2Ww6lMis3zoZhLfdxGQ3SzuRy6vGIzdaRxRw/5Zz8kb+vuWIlqyT4irkMgFe/yAOPAf9hgJWAdTHq1fZ7xJevF7howrXOgzd3Jc7AbqPLpaPM8Uh3UMFZqaKhJ5mEZbSbcc1N8XUcGqt65PAJjMJD7pPv/3r5IB51PcsxzqgeOm9m/RTGSvdPQkSiMNlgoA1p1yuYjzJEGsm0pXyowV4nf3VLukkOXozaQ2cwaw9ViAIbnqdeI+3ZEgMW+3eQ5u0uGeOlHHUfhigaRxE17vluycK3CM= wcannon@Mac-mini.local"
}


resource "aws_eip" "acme_1" {
  vpc      = true
}

resource "aws_eip" "acme_2" {
  vpc      = true
}

resource "aws_security_group" "allow_sftp" {
  name        = "allow_sftp"
  description = "Allow sftp inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "sftp from acme"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["76.17.153.117/32"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_sftp"
  }
}