variable "username"{
    type = string
    default = "World" // sets the default value
}

variable "age" {
  type = number
  default = 26
}

variable "users" {
  type = list
  default = ["Piyush", "Ritik"]
}

variable "usersAge" {
  type = map
  default = {
    piyush=26
    salil=27
  }
}