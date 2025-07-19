terraform {
  backend "s3" {
    bucket = "terraform-backend-terra-project-2025"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}
