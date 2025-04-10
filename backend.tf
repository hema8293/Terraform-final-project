terraform {
  backend "s3" {
    bucket = "priya-tfstate-2025"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}
