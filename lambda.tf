resource "aws_lambda_function" "lambda_func" {
  function_name = "buy-handler"
  runtime       = "nodejs14.x"
  handler       = "index.handler"
  role          = aws_iam_role.lambda_exec.arn
  filename      = "lambda_function.zip"
}
