// block "label1" label2{
    // identifier = expression 
// }

variable username{}

output "printName"{
    value = "Hello, ${var.username}"
}

# export TF_VAR_username=raj  we can read value from system if we define value like this
