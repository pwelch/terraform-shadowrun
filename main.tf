# main.tf

data "template_file" "user_data" {
  template = file("scripts/setup-aws.ps1")
}

resource "aws_instance" "shadowrun" {
  count                       = var.instance_count
  key_name                    = var.aws_key_pair
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "${var.name}-${count.index}"
  }
}