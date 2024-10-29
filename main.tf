resource "aws_vpc" "group3_nginx_vpc" {
  cidr_block       = var.vpc_cidr_block
  
  tags = {
    Name = "devops-group-3"
  }
}

resource "aws_subnet" "group3_nginx_subnet" {
  vpc_id     = aws_vpc.group3_nginx_vpc.id
  cidr_block = var.subnet_cidr_block
  availability_zone = "${var.region}b"
  tags = {
    Name = "devops-group-3"
  }
}

resource "aws_internet_gateway" "group3_nginx_igw" {
  vpc_id = aws_vpc.group3_nginx_vpc.id

  tags = {
    Name = "devops-group-3"
  }
}

resource "aws_route_table" "group3_nginx_route_table" {
  vpc_id = aws_vpc.group3_nginx_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.group3_nginx_igw.id
  }
}

resource "aws_route_table_association" "group3_nginx_route_table_association" {
  subnet_id      = aws_subnet.group3_nginx_subnet.id
  route_table_id = aws_route_table.group3_nginx_route_table.id
}

resource "aws_security_group" "group3_nginx_security_group" {
  vpc_id = aws_vpc.group3_nginx_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  
  ingress{
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
   }
  tags = {
    Name = "devops-group-3"
  }
}


resource "aws_instance" "group3_nginx_server" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.group3_nginx_subnet.id
  security_groups = [ aws_security_group.group3_nginx_security_group.id]
  associate_public_ip_address = true

  tags = {
    Name = var.tag_name
  }
  user_data = file("userdata.sh")
  

}



