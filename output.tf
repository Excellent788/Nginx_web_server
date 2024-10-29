output "instance_ip" {
  value = aws_instance.group3_nginx_server.public_ip

}
output "instance_name" {
  value = aws_instance.group3_nginx_server.tags["Name"]
}