variable "region" {
  description = "Value of the region to deploy infrastructure"
  type        = string
  default     = "us-east-1"
}

variable "bucket" {
  description = "Value of the bucket name for flask app"
  type        = string
  default     = "flask-app-test-bucket"
}

variable "ecr" {
  description = "Value of the ecr name for infrastructure"
  type        = string
  default     = "test-task-repo-private"
}

variable "sg" {
  description = "Value of the sg name for infrastructure"
  type        = string
  default     = "whitelist_sg"
}

variable "iam_role" {
  description = "Value of the iam role name for instance"
  type        = string
  default     = "flask-app-role"
}

variable "iam_policy" {
  description = "Value of the iam policy name for instance"
  type        = string
  default     = "flask-app-s3-policy"
}

variable "iam_profile" {
  description = "Value of the iam profile name for instance"
  type        = string
  default     = "flask-profile"
}