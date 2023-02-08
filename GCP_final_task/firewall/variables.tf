variable "firewall_name"{}
variable "vpc_name"{}
variable "protocol"{}
variable "ports"{
    type=list
}
variable "vms_to_be_accessed"{
    type = list
}
variable "iap-ip" {
  
}
