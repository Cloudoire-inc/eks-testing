variable "subnet_ids"{
    type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "cidr_block" {
  type = any
}
variable "db_user" {
  type = string
}
variable "db_name" {
  type = string
}
variable "db_password" {
  type = string
}