resource "aws_db_instance" "sample" {
  engine            = "mysql"
  allocated_storage = 10
  instance_class    = "db.t2.micro"
  name              = "example_database"
  username          = "admin"
  password          = "${var.db_password}"
  snapshot_identifier = "some-snap"
  skip_final_snapshot = true
}
