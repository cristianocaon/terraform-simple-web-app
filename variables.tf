variable "access_key" {
  description = "Access key to IAM user."
  sensitive = true
}
variable "secret_key" {
  description = "Secret key to IAM user."
  sensitive = true
}
variable "ec2_name" {
  description = "Name of the instance."
  default = "ec2_test"
}
variable "ec2_count" {
  description = "Number of instances."
  default = 1
}
variable "ec2_type" {
  description = "Type of EC2 instance."
  default = "t2.micro"
}
variable "ec2_ami_id" {
  description = "The Amazon Linux AMI."
  default = "ami-0715c1897453cabd1"
}
variable "ec2_sec_grp_name" {
  description = "Name for security group of EC2 instance."
  default = "ec2_sec_grp"
}
