provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}

resource "aws_instance" "sample" {
  ami           = "ami-188fba77"
  instance_type = "t2.micro"
  tags {
    Name = "terraform_example"
  }
}
