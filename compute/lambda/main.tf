resource "aws_lambda_function"  "lambda" {
  count              = "${var.create_lambda ? length(var.handler_list) : 0}"
  #count              = "${length(var.handler_list)}"
  filename           = "${element(var.filename_list, count.index)}"
  function_name      = "${element(var.function_name, count.index)}"
  handler            = "${element(var.handler_list, count.index)}"
  runtime            = "${var.runtime}"
  #role               = "${aws_iam_role.LambdaIAMRole.arn}"
  role               = "${var.iam_role}"
  tags               = "${var.tags}"
  description        = "${var.description}"
  source_code_hash   = "${element(var.source_code_hash_list, count.index)}"
  memory_size        = "${var.memory_size}"
  timeout            = "${var.timeout}"
  kms_key_arn        = "${var.kms_key_arn}"
  #below conflicts with filename

  #uncomment if needed
  /*
  dead_letter_config {
    target_arn       =  "${var.target_arn}"
  }
 */
  #vpc_config = "${var.vpc_config}"
  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }

  environment = "${var.environment}"
  dead_letter_config = "${var.dead_letter_config}"
}

resource "aws_lambda_permission" "lamba_permission"{
  count          = "${var.lambda_permission_count}"
  statement_id   = "${element(var.statement_id, count.index)}"
  action         = "${element(var.action, count.index)}"
  function_name  = "${element(var.name_lambda_permission, count.index)}"
  principal      = "${element(var.principal_lambda_permission, count.index)}"
  source_arn     = "${element(var.source_arn, count.index)}"
}


resource "aws_lambda_permission" "lamba_permission_account"{
  count          = "${var.lambda_permission_count_account}"
  statement_id   = "${element(var.statement_id, count.index)}"
  action         = "${element(var.action, count.index)}"
  function_name  = "${element(var.name_lambda_permission, count.index)}"
  principal      = "${element(var.principal_lambda_permission, count.index)}"
  source_arn     = "${element(var.source_arn, count.index)}"
  source_account = "${element(var.source_account, count.index)}"
}

resource "aws_lambda_function"  "lambda_with_s3" {
  count              = "${var.create_lambda_s3 ? 1 : 0}"
  #count              = "${length(var.handler_list)}"
  #filename           = "${element(var.filename_list, count.index)}"
  function_name      = "${element(var.function_name, count.index)}"
  handler            = "${element(var.handler_list, count.index)}"
  runtime            = "${var.runtime}"
  role               = "${var.iam_role}"
  tags               = "${var.tags}"
  description        = "${var.description}"
  memory_size        = "${var.memory_size}"
  timeout            = "${var.timeout}"
  kms_key_arn        = "${var.kms_key_arn}"
  #below conflicts with filename
  s3_bucket         = "${var.s3_bucket}"
  s3_key            = "${var.s3_key}"
  s3_object_version = "${var.s3_object_version}"
  #uncomment if needed
  /*
  dead_letter_config {
    target_arn       =  "${var.target_arn}"
  }
 */
 #vpc_config = "${var.vpc_config}"
 environment = "${var.environment}"
 dead_letter_config = "${var.dead_letter_config}"

  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }
}
