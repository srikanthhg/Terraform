variable "project_name" {

}
variable "environment" {

}
variable "sg_name" {

}
variable "sg_description" {
    type = string
}
variable "vpc_id" {

} 
variable "common_tags" {
    default = {}
    type = map
} 
variable "sg_tags" {
    default = {}
    type = map
} 
variable "sg_ingress_rules" {
    type = list
    default = []
}