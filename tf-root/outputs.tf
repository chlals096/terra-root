# # output "instance_info" {
# #     value = aws_instance.terra_insance
# # }


# # 생성된 인스턴스의 private DNS를 output으로 지정
# output "private_dns" {
#   description = "instacne's public IP"
#   value       = [for k, v in aws_instance.terra_insance : v.private_dns]
# }


# # 생성된 인스턴스의 public IP를 output으로 지정
# output "public_ip" {
#   description = "instacne's public IP"
#   value       = [for k, v in aws_instance.terra_insance : v.public_ip]
# }



# # 생성된 인스턴스의 private IP를 output으로 지정
# output "private_ip" {
#   description = "instacne's public IP"
#   value       = [for k, v in aws_instance.terra_insance : v.private_ip]
# }



# # 생성된 인스턴스의 ARN를 output으로 지정
# output "arn" {
#   description = "instacne's public IP"
#   value       = [for k, v in aws_instance.terra_insance : v.arn]
# }


# # 생성된 인스턴스의 Creater 를 output으로 지정
# output "tags_creater" {
#   description = "instacne's creater"
#   value       = [for k, v in aws_instance.terra_insance : v.tags.creater]
# }



# # 생성된 인스턴스의 AZ 를 output으로 지정
# output "EC2_availability_zone" {
#   description = "instacne's AZ"
#   value       = [for k, v in aws_instance.terra_insance : v.availability_zone]
# }



# output "public_subnet_ARN" {
#   description = "subnets ARN"
#   value       = [for k, v in aws_subnet.terra_public_subnet : v.arn]
# }