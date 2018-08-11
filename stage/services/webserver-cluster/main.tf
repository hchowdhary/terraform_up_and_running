module "webserver_cluster" {
  source = "git@github.com:hchowdhary/terraform_up_and_running.git//modules/services/webserver-cluster?ref=v0.0.2"

  cluster_name           = "webservers-stage"
  db_remote_state_bucket = "g24x7-himanshu-terraform-state"
  db_remote_state_key    = "stage/data-stores/mysql/terraform.tfstate"
  instance_type          = "t2.micro"
  min_size               = 2
  max_size               = 3
}