resource "aws_efs_file_system" "vol1" {
  creation_token = "var.efs_name"

  tags = {
    Name = var.efs_name
  }
}

resource "aws_efs_mount_target" "mnt_tgt_east" {
  file_system_id = aws_efs_file_system.vol1.id
  subnet_id      = "subnet-07931505aba2dd645"
}
