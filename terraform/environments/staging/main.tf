provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Project     = "spring-petclinic-microservices"
      ManagedBy   = "Terraform"
      Environment = "staging"
      Sprint      = "S2-Core-Infrastructure"
      Task        = "SPC-005-T4"
    }
  }
}

module "ecr" {
  source = "../../modules/ecr"

  aws_region           = "us-east-1"
  environment          = "staging"
  repository_prefix    = "spring-petclinic"
  image_tag_mutability = "MUTABLE"
  encryption_type      = "AES256"
  max_image_count      = 10
  image_tag            = "7a700b9"
}
