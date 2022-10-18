variable "sample" {
    default = "Hello World"
}

output "sample-op" {
    value = var.sample 
}

output "sample-op1" {
    value = "Value is ${var.sample}"
}

# A variable can be accessed with or without ${} only if the variable is called. But in case if it is needed to add with some other strings then we need to use double
# There is no concept of single quores in terraform.

variable "number" {
    default = 100 
}

output "number" {
    value = var.number  
}

#Declaring a list variable
variable "ex-list" {
    default = [
        "AWS",
        "GCP",
        "DevOps",
        100,
        true,
        "Verma" 
    ]
}

# From the above list, you can see that data in list can be of any type indivudually. 
output "ex-list-op" {
    value = "Welcome to ${var.ex-list[2]} Training and this contains  ${var.ex-list[0]} and the trainer name is  ${var.ex-list[5]}"
}

# Declaring a map variable 
variable "ex-map" {
     default = {
        Class = "DevOps",
        Duration = 85
        Trainer  = "Verma", 
        Batch    = "0600AM"
     }
}

output "ex-map" {
    value = "Welcome to ${var.ex-map["Class"]} Training and the duration of the training is ${var.ex-map["Duration"]} hours and the schedule time ${var.ex-map["Batch"]}  "
}

# Declaring an empty variable
variable "City" {}

output "city" {
    value = "City name is ${var.City}"
}

# Declaring an empty variable 

variable "State" {}

output "state" {
    value = var.State
}