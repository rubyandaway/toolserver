source "amazon-ebs" "linux" {

  # AWS AMI data source lookup 
  source_ami_filter {
    filters = {
      name                = "amzn2-ami-hvm-*-x86_64-ebs"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]

  }

  # AWS EC2 parameters
  ami_name      = "toolserver-${regex_replace(timestamp(), "[- TZ:]", "")}"
  instance_type = "t3.micro"
  region        = "us-east-1"


  # provisioning connection parameters
  communicator                 = "ssh"
  ssh_username                 = "ec2-user"


  tags = {
    Environment     = "dev"
    Name            = "toolserver${regex_replace(timestamp(), "[- TZ:]", "")}"
    PackerBuilt     = "true"
    PackerTimestamp = regex_replace(timestamp(), "[- TZ:]", "")
    Service         = "toolserver"
  }
}


build {
  sources = ["source.amazon-ebs.linux"]

  provisioner "shell" {
    scripts = [
      "toolserver/packer/base-ami/provision.sh",
   ]
  }

}
