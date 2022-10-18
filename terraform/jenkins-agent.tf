resource "aws_instance" "ec2_bastion" {
  ami                  = data.aws_ami.this.id
  instance_type        = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_from_all.id]
  subnet_id                   =  module.network.public_subnet_av_zone1_id   # aws_subnet.public_subnet_1.id
  associate_public_ip_address = true
  key_name = "mostafa2"
  tags = {
    Name = "jenkins_agent"
  }
  provisioner local-exec {
    command = "echo ${self.public_ip} > inventory"   
  }
}
