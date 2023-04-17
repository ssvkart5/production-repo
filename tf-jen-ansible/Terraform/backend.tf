terraform {
  backend "s3" {
    bucket = "mylab-statefile-bucket"
    key = "server_name/statefile"
    region = "us-east-1"
  }
}  
