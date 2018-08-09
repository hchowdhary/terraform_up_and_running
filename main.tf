provider "aws" {
  region  = "ap-south-1"
  profile = "terraform"
}
variable "server_port" {
  description = "Port on which web server will listen to."
  default = 8080
}

data "aws_availability_zones" "available" {}

resource "aws_launch_configuration" "sample" {
  image_id                    = "ami-188fba77"
  instance_type          = "t2.micro"
  security_groups = ["${aws_security_group.web_server_sg.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "I love Terraform !!" > index.html
              nohup busybox httpd -f -p "${var.server_port}" &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "web_server_sg" {
  name = "terraform_example_webserver"

  ingress {
    from_port   = "${var.server_port}"
    to_port     = "${var.server_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "sample" {
  launch_configuration = "${aws_launch_configuration.sample.id}"
  availability_zones = ["${data.aws_availability_zones.available.names}"]
  min_size = 2
  max_size = 10

  tag {
    key = "Name"
    value = "terraform_asg_sample"
    propagate_at_launch = true
  }
}

