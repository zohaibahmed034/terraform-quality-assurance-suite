# Fixed syntax errors

resource "aws_instance" "fixed_instance" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  
  # Fixed closing quote
  tags = {
    Name = "fixed-instance"
  }
}

# Fixed output with correct syntax
output "fixed_output" {
  value = aws_instance.fixed_instance.id
}
