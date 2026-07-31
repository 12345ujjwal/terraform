#Generate the key-pair by "ssh-keygen", give the path and press Enter

#Key pair Login
resource "aws_key_pair" "my_key" {
	key_name= "key"
	public_key= file("key.pub")
#OR     public key= "paste the key here"
}

#VPC and Security Group
resource aws_default_vpc default {
}
	
resource aws_security_group my_sg {
	name= "automate-sg"
	description= "This will add a terraform generated Security Group helping EC2 launch"
	vpc_id= aws_default_vpc.default.id     #interpolation

	#Inbound Rules
	ingress{
		from_port= 22
		to_port= 22
		protocol= "tcp"
		cidr_blocks= ["0.0.0.0/0"]
		description= "SSH Open for all"
	}
  
	#Outbound Rules
	egress{
		from_port= 0
		to_port= 0
	        protocol= "-1"
		cidr_blocks= ["0.0.0.0/0"]
	        description= "All Access"
	}
}

#Creating EC2 Instance
resource "aws_instance" "demo_instance" {
	key_name= aws_key_pair.my_key.key_name
	security_groups= [aws_security_group.my_sg.name]
	instance_type= "t3.micro"
	ami= "ami-0b6d9d3d33ba97d99"
	root_block_device {
		volume_size= 10
		volume_type= "gp3"
	}
	tags = {
		Name= "terraform-ec2"
	}
}
