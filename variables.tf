variable "access_key" {
  description = "Access key to AWS console."
}
variable "secret_key" {
  description = "Secret key to AWS console."
}
variable "public_key" {
  description = "Public key from AWS EC2 key pair."
}
variable "ec2_name" {
  description = "Name of the instance."
  default = "flask_ec2_terraform_test"
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
variable "ec2_sec_grp" {
  description = "Name for security group of EC2 instance."
  default = "ec2_sec_grp"
}
