module "webserver_cluster" {
  source = "../../../modules/services/webserver-cluster"

  cluster_name = "webservers-prod"
  db_remote_state_bucket = "g24x7-himanshu-terraform-state"
  db_remote_state_key = "prod/data-stores/mysql/terraform.tfstate"
}
