variable "filename" {
  type = string
  default = "abc.txt"
}

variable "filename1" {
  type = string
  default = "abc1.txt"
}

variable "filename2" {
  type = string
  default = "abc2.txt"
}

variable "int_content" {
  type = number
  default = 23
}

# 
variable "bool_content" {
  type = bool
  default = true
}


variable "list_content" {
  type = list(string)
  default = [ "red", "green", "blue" ]
}


variable "tuple_content" {
  type = tuple([ string, bool, number ])
  default = [ "abc", false, 0 ]
}


variable "map_content" {
  type = map
  default = {name = "Ankit", age = 27}
}