provider "aws" {
    region = "us-east-1"
    access_key = "XXXXXXX"
    secret_key = "XXXXXXX"
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
      Name = "production"
      CreatedBy = "Terraform"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

 tags = {
      Name = "production"
      CreatedBy = "Terraform"
  }
  
}

resource "aws_instance" "my-first-server" {
    ami = "ami-0e472ba40eb589f49"
    instance_type = "t2.micro"

    tags = {
        CreatedBy = "Terraform"
        Name = "Ubuntu Server"
    }

}