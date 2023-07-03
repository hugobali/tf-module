# Set TF Variables
variable "ami_id" {
  #default=""
  description = "AMI ID information"
  # Type: String| map | list
  #type =
}

variable "instance_type" {
  description = "Instance Type Informaton"
}

variable "tags" {
  description = "Tags Information"
  type        = map(any)
}

variable "sg_name" {

}

variable "ingress_rules" {

}
