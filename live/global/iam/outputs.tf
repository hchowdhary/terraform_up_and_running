output "iam_user_arns" {
  value = ["${aws_iam_user.sample.*.arn}"]
}
