#op


output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "ec2_instance_id" {
  value = aws_instance.my_ec2.id
}

output "ec2_public_ip" {
  value = aws_instance.my_ec2.public_ip
}
