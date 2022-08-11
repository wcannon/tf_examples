resource "aws_efs_file_system" "vol1" {
  creation_token = "var.efs_name"

  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "mnt_tgt_east_1a" {
  file_system_id = aws_efs_file_system.vol1.id
  subnet_id      = "subnet-07931505aba2dd645"
  security_groups = []
}

resource "aws_efs_mount_target" "mnt_tgt_east_1b" {
  file_system_id = aws_efs_file_system.vol1.id
  subnet_id      = "subnet-0eca688eca8a4ca59"
  security_groups = []
}

resource "aws_efs_mount_target" "mnt_tgt_east_1c" {
  file_system_id = aws_efs_file_system.vol1.id
  subnet_id      = "subnet-062ba339b2b6610e5"
  security_groups = []
}