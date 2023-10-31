terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # tls = {
    #   source  = "hashicorp/tls"
    #   version = "~> 4.0"
    # }
  }
}



# # Configure the AWS Provider
# provider "aws" {
#   region     = var.aws_region     # variable.tf 의 aws_region 변수사용

# }



# # aws_vpc/tf파일들의 내용을 불러와서 사용
# module "vpc" {
#   source = "https://github.com/chlals096/aws_vpc.git"
#   # cidr_network = "192.168.0.0/16"
# }




# # Create a VPC
# resource "aws_vpc" "terra_vpc" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name     = "terra_vpc-bo-07"
#     createBy = "terraform"
#   }
# }



# # aws_subnet/...tf파일들의 내용을 불러와서 사용
# module "subnet" {
#   source = "https://github.com/chlals096/aws_subnet.git"
#   # cidr_block = "192.168.0.0/24" # 기본은 aws_subnet/variable 의 cidr_block / 여기에 Cidr을 입력하면 
#   vpc_id = module.vpc.vpc_id
# }






# module "keypair" {
#   source   = "https://github.com/chlals096/aws_keypair.git"
#   key_name = "terra_gen_key-bo-07"
# }






# module "instance" {
#   source    = "./aws_instance/"
#   subnet_id = module.subnet.subnet_output_id
#   key_name  = module.keypair.key_name
#   sg_name   = module.security-group.sg_name
#   sg_id     = module.security-group.sg_id
# }





# # Create a Subnet
# resource "aws_subnet" "terra_subnet" {
#   vpc_id                  = aws_vpc.terra_vpc.id
#   cidr_block              = "10.0.0.0/24"
#   availability_zone       = "${var.aws_region}a"
#   map_public_ip_on_launch = true
#   tags = {
#     Name     = "terra_subnet-bo-07"
#     createBy = "terraform"
#   }
# }

# # Create a Public Subnet
# resource "aws_subnet" "terra_public_subnet" {
#   count      = 2
#   vpc_id     = aws_vpc.terra_vpc.id
#   cidr_block = "10.0.${count.index}.0/24"
#   # 짝수 번호는 가용영역 a 로 홀수 번호는 가용영역 b 로 설정
#   availability_zone       = "${var.aws_region}${count.index % 2 == 0 ? "a" : "b"}"
#   map_public_ip_on_launch = true
#   tags = {
#     Name      = "terra_public_subnet${count.index + 1}"
#     createdBy = "terraform"
#   }
# }

# # Create a Private Subnet
# resource "aws_subnet" "terra_private_subnet" {
#   count      = 2
#   vpc_id     = aws_vpc.terra_vpc.id
#   cidr_block = "10.0.${count.index + 2}.0/24"
#   # 짝수 번호는 가용영역 a 로 홀수 번호는 가용영역 b 로 설정
#   availability_zone       = "${var.aws_region}${count.index % 2 == 0 ? "a" : "b"}"
#   map_public_ip_on_launch = false
#   tags = {
#     Name      = "terra_private_subnet${count.index + 1}"
#     createdBy = "terraform"
#   }
# }



# # Create EC2 Instance
# resource "aws_instance" "terra_insance" {
#   # 변환함수
#   # toset / tolist / tobool / tonumber / tostring
#   for_each          = tomap({ "1" = "${var.aws_region}a", "2" = "${var.aws_region}b" })
#   instance_type     = "t3.micro"
#   availability_zone = each.value
#   ami               = "ami-0556fb70e2e8f34b7"
#   subnet_id         = aws_subnet.terra_public_subnet[tonumber(each.key) - 1].id
#   tags = {
#     Name     = "terra_instance_${each.value}_${each.key}-bo-07"
#     createBy = "terraform"
#     creater  = "choi"
#   }
# }



