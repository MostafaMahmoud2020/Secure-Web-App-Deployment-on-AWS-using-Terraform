data "aws_ami" "linux_ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }
}


resource "aws_instance" "instance1" {
  ami                         = data.aws_ami.linux_ami_id.id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.sg]
  key_name                    = var.key_name
  associate_public_ip_address = true
  tags = {
    Name = "instance1-public"
  }


 provisioner "remote-exec" {
    inline = [
    "sudo dnf install -y nginx",
    join("\n", [
      "sudo bash -c 'cat > /etc/nginx/nginx.conf <<NGINXCONF",
      "worker_processes  1;",
      "",
      "events {",
      "    worker_connections  1024;",
      "}",
      "",
      "http {",
      "    include       mime.types;",
      "    default_type  application/octet-stream;",
      "",
      "    sendfile        on;",
      "    keepalive_timeout  65;",
      "",
      "    server {",
      "        listen       80;",
      "        server_name  localhost;",
      "",
      "        location / {",
      "            proxy_pass http://${var.internal_alb_dns_name}:8080/;",
      "            proxy_set_header Host $$host;",
      "            proxy_set_header X-Real-IP $$remote_addr;",
      "            proxy_set_header X-Forwarded-For $$proxy_add_x_forwarded_for;",
      "            proxy_set_header X-Forwarded-Proto $$scheme;",
      "            proxy_connect_timeout   5s;",
      "            proxy_read_timeout     60s;",
      "        }",
      "    }",
      "}",
      "NGINXCONF'"
    ]),
    "sudo nginx -t",
    "sudo systemctl restart nginx",
    "sudo systemctl enable nginx"
  ]

    connection {
      type        = "ssh"
      user        = "ec2-user"  # Or "ubuntu" if you're using Ubuntu AMIs
      private_key = file("~/keys/${var.key_name}.pem")
      host        = self.public_ip
    }
 }

 provisioner "local-exec" {
      command = "echo 'public instance-1 IP: ${self.public_ip}' >> /home/mostafa/terralab/final-project/project/all-ips.txt" 
    }

}
