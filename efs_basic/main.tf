resource "aws_efs_file_system" "vol1" {
  creation_token = "var.efs_name"

  tags = {
    Name = var.efs_name
  }
}
