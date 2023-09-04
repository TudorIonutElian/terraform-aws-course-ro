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

variable "my_custom_map" {
  description = "Primul meu map in terraform"
  type = map(string)

  default = {
    "my_custom_map_tag_1" = "my_custom_map_tag_1_value"
    "my_custom_map_tag_2" = "my_custom_map_tag_2_value"
    "my_custom_map_tag_3" = "my_custom_map_tag_3_value"
  }
}


variable "my_object" {
  description = "Prima variabila object"

  type = object({
    first_tag_object = string
    second_tag_object = string
  })

  default = {
    first_tag_object = "first_tag_object_value"
    second_tag_object = "second_tag_object_value"
  }
}

variable "my_instance" {
  description = "Prima mea variabila tuple"
  type = tuple([ string, number, bool ])

  default = [ "t2.micro", 2, true ]
}

variable "check_null" {
   description = "Prima mea variabila null"
   type = null
}
