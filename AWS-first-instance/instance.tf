//it will directly get latest image name from AWS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "personal-ec2-using-tf" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key-ec2-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  tags = {
    Name = "first-instance"
  }

  user_data = file("${path.module}/script.sh")

  #Provisioner -> file, local-exec, remote-exec

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${path.module}/id_rsa")
    host        = self.public_ip
  }


  // NOTE: when ever a provisioner failed it marks the resource as 'Tainted', which tells TF to delete and create new resource for this next time as it is broken

  //copy file from local machine to ec2
  provisioner "file" {
    source      = "readme.md"       //terraform machine
    destination = "/temp/readme.md" //remote machine
  }

  // create a content.md file with this content
  provisioner "file" {
    content     = "This is test content" //terraform machine
    destination = "/temp/content.md"     //remote machine
  }

  //run the comand on working directory in local
  provisioner "local-exec" {
    command = "echo ${self.public_ip} > /tmp/mypublicip.txt"
  }

  // this provisioner will run when we create instance
  provisioner "local-exec" {
    command = "echo 'at create'"
  }

  // this provisioner will run when we destroy instance
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'at delete'"
  }

  //run the comand on created resource like ec2
  provisioner "remote-exec" {
    inline = [
      "ifconfig > /tmp/ifconfig.output",
      "echo 'hello' > /tmp/test.txt"
    ]
  }
}