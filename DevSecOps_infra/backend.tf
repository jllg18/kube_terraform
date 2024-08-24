terraform {
  backend "s3" {
    bucket         = "eksterrabucketdisruptingdevsepopsado"
    key            = "backend/devsecops.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamoDB-terra"
  }
}