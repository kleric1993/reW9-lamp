# Generates a secure private k ey and encodes it as PEM
resource "tls_private_key" "lightsail-key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
# Create the Key Pair
resource "aws_lightsail_key_pair" "lightsail-key" {
  name   = "lamp"
  public_key = tls_private_key.lightsail-key.public_key_openssh
}
# Save file
resource "local_file" "ssh_key" {
  filename = "lamp.pem"
  content  = tls_private_key.lightsail-key.private_key_pem
}