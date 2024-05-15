resource "aws_route53_record" "rc1" {
  zone_id = "Z0300747GTNO58V1W9HT"
  type = "A"
  ttl = 300
  name = "rev2.ericloukou.xyz"
  records = [ aws_lightsail_instance.server1.public_ip_address ]
}