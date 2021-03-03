# variables.tf

# AWS Variables
variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "aws_az" {
  description = "AWS availability zone"
  default     = "us-east-1d"
}

# Instance Variables
variable "instance_type" {
  description = "Type of EC2 instance to provision."
  default     = "t2.micro"
}

variable "instance_ami" {
  description = "Instance AMI"
  default     = "ami-02642c139a9dfb378"
}

variable "name" {
  description = "Name to pass to EC2 Name tag"
  default     = "tf-shadowrun"
}

variable "instance_count" {
  description = "Number of instances to create"
  default     = 1
}

variable "aws_key_pair" {
  type        = string
  description = "The AWS Key Pair Name"

}