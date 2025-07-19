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
    ami = data.aws_ami.linux_ami_id.id
    instance_type = var.instance_type
    subnet_id = var.private_subnet_id
    vpc_security_group_ids = [var.sg]
    key_name = var.key_name
     tags = {
      Name = "instance1-private"
    }

 user_data = <<-EOF
              #!/bin/bash
              # Install Python3
              sudo yum update -y
              sudo yum install python3 -y

              # Write a test Python web server
              cat <<EOL > /home/ec2-user/test_server.py
              from http.server import BaseHTTPRequestHandler, HTTPServer

              class Handler(BaseHTTPRequestHandler):
                  def do_GET(self):
                      self.send_response(200)
                      self.send_header('Content-type', 'text/plain')
                      self.end_headers()
                      self.wfile.write(b'Hello from your EC2 instance! 1 ')

              HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()
              EOL

              # Run the server (background)
              python3 /home/ec2-user/test_server.py &
              EOF


   

    provisioner "local-exec" {
      command = "echo 'private instance-1 IP: ${self.private_ip}' >> /home/mostafa/terralab/final-project/project/all-ips.txt" 
    }
  
}