output "printName"{
    value = "Hello, ${var.username}, your age is ${var.age} First name in list Users list is ${var.users[0]}"
}


# terraform plan -var "username=Piyush Gupta"

output "printFirst" {
  value = "${join("-->",var.users)}"
}


output "capitalName" {
  value = "${upper(var.username)}"
}

output "userAge" {
    value = "my name is ${var.username} and my age is ${lookup(var.usersAge, var.username)}"
}