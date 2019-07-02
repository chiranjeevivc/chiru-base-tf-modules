variable "create_lambda_s3" {
  default = false
}

variable "create_lambda" {
  default = false
}

variable "handler_list"{
  description = "The function entrypoint in your code."
  type ="list"
  default = []
}

variable "iam_role"{}

variable "lambda_permission_count"{
  default = 0
}
variable "lambda_permission_count_account"{
  default = 0
}


variable "source_arn"{
  default = []
  type = "list"
}
variable "source_account"{
  default = []
  type = "list"
}

variable "statement_id"{
  default = []
  type = "list"
}
variable "action"{
  default = []
  type = "list"
}
/*
variable "vpc_config"{
  type = "list"
}*/
variable "environment"{
  type = "list"
  default = []
}
variable "dead_letter_config"{
  type = "list"
  default = []
}

variable "filename_list"{
  description = "The path to the function's deployment package within the local filesystem. If defined, The s3_-prefixed options cannot be used."
  type ="list"
  default = []
}
variable "function_name"{
  description = "A unique name for your Lambda Function."
  type ="list"
  default =[]
}
variable "runtime"{
  description = "See Runtimes for valid values."
}

variable "subnet_ids"{
  type= "list"
  default=[]
}
variable "security_group_ids"{
  type= "list"
  default=[]
}

variable "tags"{
  type="map"
}



variable "source_code_hash_list"{
  type = "list"
  default = []
}


variable "memory_size"{
  description = "Amount of memory in MB your Lambda Function can use at runtime. Defaults to 128. See Limits"
  default = "128"
}

variable "timeout"{
  description = "The amount of time your Lambda Function has to run in seconds. Defaults to 3. See Limits"
  default = "3"
}

variable "kms_key_arn"{
  description = "The ARN for the KMS encryption key"
  default=""
}

#conflicts with function_name.

variable "s3_bucket"{
 description = "The S3 bucket location containing the function's deployment package"
 default = ""
}

variable "s3_key"{
  description = "The S3 key of an object containing the function's deployment package. Conflicts with filename."
  default = ""
}

variable "s3_object_version"{
  description = "The object version containing the function's deployment package. Conflicts with filename."
  default = ""
}

/* Uncomment if using dead_letter_config
variable "target_arn"{
  default=""
}
*/

variable "name_lambda_permission"{
  type="list"
  default = []
}

variable "description"{
  default=""
}


variable "principal_lambda_permission"{
  type="list"
  default=[]
}
