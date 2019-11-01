resource "aws_s3_bucket" "terraform_state" {
  bucket        = "rd-tutorial-terraform"
  policy        = "${file("backend-s3-policy-${terraform.workspace}.json")}"
  acl           = "public-read"
  force_destroy = true

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}