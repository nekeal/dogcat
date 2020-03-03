terraform {
  backend "s3" {
    bucket = "backend-state-task"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}