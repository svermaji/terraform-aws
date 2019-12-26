data "aws_caller_identity" "current_user" {}

data "aws_region" "user_region" {}

output "account_id" {
  value = "${data.aws_caller_identity.current_user.account_id}"
}

output "caller_user" {
  value = "${data.aws_caller_identity.current_user.user_id}"
}

output "caller_arn" {
  value = "${data.aws_caller_identity.current_user.arn}"
}

output "caller_region" {
  value = "${data.aws_region.user_region.name}"
}
