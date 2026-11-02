//Creating SSH Key
resource "aws_key_pair" "key-ec2-tf" {
  key_name   = "key-ec2-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = aws_key_pair.key-ec2-tf.key_name
}