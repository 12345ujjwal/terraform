#Creating AWS S3 bucket

resource "aws_s3_bucket" "demo_bucket" {
	bucket = "test-tf-bucket-56245913"
}
