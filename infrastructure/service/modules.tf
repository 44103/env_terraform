module "iam_api_to_lambda" {
  source   = "../modules/iam/lambda"
  aws_name = local.aws_name
}

module "lambda" {
  source    = "../modules/lambda"
  aws_name  = local.aws_name
  iam_role  = module.iam_api_to_lambda
  file_path = "../dist/source.zip"
}

module "apigw" {
  source   = "../modules/apigw"
  aws_name = local.aws_name
  lambda   = module.lambda
  path_part = "api"
}
