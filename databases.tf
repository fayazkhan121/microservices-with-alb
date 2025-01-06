resource "aws_rds_cluster" "aurora" {
  cluster_identifier = "aurora-cluster"
  engine             = "aurora-mysql"
  master_username    = "admin"
  master_password    = "password123"
}

resource "aws_dynamodb_table" "dynamodb" {
  name         = "dynamodb-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
