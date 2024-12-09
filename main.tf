provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "jackietest-9374864t"


  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}