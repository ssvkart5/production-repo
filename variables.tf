variable "AWS_REGION" {
  default = "us-east-2"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "us-west-keypair.pem"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = ""
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-02396cdd13e9a1257"
    us-west-2 = "ami-009c5f630e96948cb"
    us-west-1 = "ami-0578f2b35d0328762"
    us-east-2 = "ami-0578f2b35d0328762"
  }
}