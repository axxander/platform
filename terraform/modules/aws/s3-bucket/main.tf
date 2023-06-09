variable "organisation" {
  type = string
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.organisation}-${uuid()}"
}

output "bucket_name" {
  value = aws_s3_bucket.this.id
}
