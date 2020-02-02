resource "aws_s3_bucket" "sv_s3" {
  bucket = "sv-s3"
  force_destroy = true

  tags = {
    Name = "sv-s3-bucket"
    HSN = "sv-s3-bucket"
  }
}

/*
resource "aws_s3_bucket_public_access_block" "sv_s3_access_block" {
  bucket = aws_s3_bucket.sv_s3.id

  block_public_acls = true
  block_public_policy = true
}

*/
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.sv_s3.id

  policy = <<POLICY
{
  "Id": "${aws_s3_bucket.sv_s3.id}-policy",
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "${aws_s3_bucket.sv_s3.id}-stmt-list",
      "Action": [
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::sv-s3",
      "Principal": {
        "AWS": [
          "arn:aws:iam::761576524318:user/ec2-to-s3"
        ]
      }
    },
    {
      "Sid": "${aws_s3_bucket.sv_s3.id}-crud",
      "Action": [
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:PutObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::sv-s3/*",
      "Principal": {
        "AWS": [
          "arn:aws:iam::761576524318:user/ec2-to-s3"
        ]
      }
    }
  ]
}
POLICY
}
