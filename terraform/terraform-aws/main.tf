resource "aws_iam_user" "admin-user" {
  name = "lucy"
  tags = { description = "Technical Team Lead" }
}

resource "aws_iam_policy" "admin-user-policy" {
  name = "AdminUsers"
  policy = file("admin-policy.json")
}

resource "aws_iam_user_policy_attachment" "admin-access" {
  user = aws_iam_user.admin-user.name
  policy_arn = aws_iam_policy.admin-user-policy.arn
}

resource "aws_s3_bucket" "finance" {
  bucket = "finance-20250320"
    tags = { description = "Dummy Finance Data" }
}

resource "aws_s3_bucket_object" "finance-2025" {
  content = "path/of/the/file/finance-2025.doc"
  key = "finance-2025.doc"
  bucket = aws_s3_bucket.finance.id
}

data "aws_iam_group" "finance_data" {
    group_name = "finance-analysts"
}

resource "aws_s3_bucket_policy" "finance-policy" {
  bucket = aws_s3_bucket.finance.id
  policy = file("bucket-policy-name.json")
}

resource "aws_dynamodb_table" "cars" {
  name = "cars"
  hash_key = "VIN"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "VIN"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "cars-items" {
  table_name = aws_dynamodb_table.cars.name
  hash_key = aws_dynamodb_table.cars.hash_key
  item = <<EOF
    {
        "Manufacturer": {"S": "Toyota"},
        "Make": {"S": "Corolla"},
        "Year": {"N": "2004"},
        "VIN": {"S": "123456"},
    }
  EOF
}

module "us_payroll" {
  source = "path of the templates created"
  app_region = "us-east-1"
  ami = "ami-123e4"
} 
