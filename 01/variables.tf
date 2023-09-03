variable "numar_de_instante" {
    description = "Aceasta este variabila mea pentru numarul de instante"
    type = number
    default = 2
}

variable "ec2_instance_type" {
  description = "Ec2 instance type"
  type = string
}

variable "my_first_custom_tag" {
  description = "my_first_custom_tag"
  type = string
}

variable "is_development" {
  description = "prima varabila booleana"
  type = bool
  default = true
}

variable "my_custom_tags" {
  description = "Simple list in Terraform"
  type = list(string)
  default = [ "my_first_tag", "my_second_tag", "my_third_tag" ]
}