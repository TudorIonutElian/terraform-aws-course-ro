output "ami_favorit_id" {
    description = "I will print AMI ID"
    value = data.aws_ami.ami_favorit.id
}