bucket         = "your-terraform-state-bucket"
key            = "cloud-iap/terraform.tfstate"
region         = "us-east-1"
encrypt        = true
dynamodb_table = "terraform-locks"
