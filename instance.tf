resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

  # the VPC subnet
  subnet_id = "${aws_subnet.main_public-1.id}"

  # the security group
  vpc_security_group_ids = [aws_security_group.main-sg.id]

  # the public SSH key
  key_name = var.PATH_TO_PRIVATE_KEY
}