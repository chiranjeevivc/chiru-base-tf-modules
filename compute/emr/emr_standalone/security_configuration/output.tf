output "emr_security_configuration"{
  value ="${aws_emr_security_configuration.emr_sc_encryption.name}"
}

# output "emr_kms_key_id"{
#   value ="${aws_kms_key.emr_kms_key.key_id}"
# }
