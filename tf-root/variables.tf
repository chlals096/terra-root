variable "aws_region" {
  type        = string
  description = "AWS Region Code입니다. (default: ap-northeast-2)"
  default     = "ap-northeast-2"
  validation {
    # condition 
    # 문자, 문자열, 숫자 범위(IP주소)도 가능 
    condition     = contains(["ap-southeast-1"], var.aws_region)
    error_message = "사용가능한 리전은 ap-southeast-1 입니다."
  }
}


variable "aws_access_key" {
  type        = string
  description = "AWS access-key 입니다."
  sensitive   = true
  default     = ""
}


variable "aws_secret_key" {
  type        = string
  description = "AWS secret key 입니다"
  sensitive   = true
  default     = ""
}