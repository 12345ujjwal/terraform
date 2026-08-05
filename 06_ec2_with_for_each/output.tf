output "ec2_public_ip" {
	value = [for public in aws_instance.demo_instance:public.public_ip]
}

output "ec2_private_ip" {
        value = [for private in aws_instance.demo_instance:private.private_ip]
}

output "ec2_public_dns" {
        value = [for dns in aws_instance.demo_instance:dns.public_dns]
}
