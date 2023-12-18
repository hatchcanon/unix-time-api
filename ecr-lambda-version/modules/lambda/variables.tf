variable "function_name" {
  type = string
}
variable "role_arn" {
  type    = string
  default = ""
}
variable "accountId" {
  type    = string
  default = ""
}
variable "api_id" {
  type = string
}
variable "http_method" {
  type = string
}
variable "gateway_path" {
  type = string
}
variable "description" {
  type = string
}
variable "image_uri" {
  type    = string
  default = ""
}