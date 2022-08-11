output "EFS-arn" {
    value = aws_efs_file_system.vol1.arn
}

output "EFS-availability-zone-id" {
    value = aws_efs_file_system.vol1.availability_zone_id
}

output "EFS-id" {
    value = aws_efs_file_system.vol1.id
}

output "EFS-dns-name" {
    value = aws_efs_file_system.vol1.dns_name
}

output "EFS-number-of-mount-targets" {
    value = aws_efs_file_system.vol1.number_of_mount_targets
}

output "EFS-size-in-bytes" {
    value = aws_efs_file_system.vol1.size_in_bytes
}

output "EFS-tags-all" {
    value = aws_efs_file_system.vol1.tags_all
}
/*
output "EFS-mount-target-east-id" {
    value = aws_efs_mount_target.mnt_tgt_east.id
}

output "EFS-mount-target-east-dns-name" {
    value = aws_efs_mount_target.mnt_tgt_east.dns_name
}

output "EFS-mount-target-east-mount-target-dns-name" {
    value = aws_efs_mount_target.mnt_tgt_east.mount_target_dns_name
}

output "EFS-mount-target-east-file-system-arn" {
    value = aws_efs_mount_target.mnt_tgt_east.file_system_arn
}

output "EFS-mount-target-east-availability-zone-name" {
    value = aws_efs_mount_target.mnt_tgt_east.availability_zone_name
}

output "EFS-mount-target-east-availability-zone-id" {
    value = aws_efs_mount_target.mnt_tgt_east.availability_zone_id
}

*/
output "EFS-mount-target-east-mount-target-dns-name-1a" {
    value = aws_efs_mount_target.mnt_tgt_east_1a.mount_target_dns_name
}

output "EFS-mount-target-east-mount-target-dns-name-1b" {
    value = aws_efs_mount_target.mnt_tgt_east_1b.mount_target_dns_name
}

output "EFS-mount-target-east-mount-target-dns-name-1c" {
    value = aws_efs_mount_target.mnt_tgt_east_1c.mount_target_dns_name
}