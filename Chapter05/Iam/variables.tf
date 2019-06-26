variable "names" {
  type    = list(string)
  default = ["sheldon", "lenard", "penny"]
}

variable "give_sheldon_cloudwatch_full_access" {
  description = "If true, neo gets full access to CloudWatch"
  #default = false
}