resource "aws_route53_record" "component" {
  zone_id = "Z02706543V2P7F2FG8G6T"
  name    = "${var.COMPONENT}-dev.roboshop.internal"
  type    = "A"
  ttl     = 10
  records = [aws_spot_instance_request.spot_worker.private_ip]
}