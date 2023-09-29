provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "INSTANCE_NAME" {
  ami             = "ami-03a6eaae9938c858c"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow_ssh.name]

  tags = {
    Name = "TAGGED_INSTANCE_NAME"
  }
}

resource "random_id" "bucket_id" {
  byte_length = 8
}



resource "aws_s3_bucket" "my_bucket" {
  bucket = "BUCKET-NAME-${random_id.bucket_id.hex}"

  tags = {
    Name        = "test_bucket"
    Environment = "Dev"
  }
  
}

