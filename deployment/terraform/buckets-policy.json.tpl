{
	"Version": "2012-10-17",
	"Statement": [{
			"Sid": "ReadAndWriteToS3Buckets",
			"Effect": "Allow",
			"Action": [
				"s3:PutObject",
				"s3:GetObjectAcl",
				"s3:GetObject",
				"s3:ListBucket",
				"s3:DeleteObject",
				"s3:PutObjectAcl"
			],

			"Resource": [
				"arn:aws:s3:::${bucket_name}/*",
				"arn:aws:s3:::${bucket_name}"
			],
			"Principal": {
				"AWS": [
					"${user_arn}"
				]
			}
		},
		{
			"Sid": "PublicRead",
			"Effect": "Allow",
			"Principal": "*",
			"Action": ["s3:GetObject"],
			"Resource": ["arn:aws:s3:::${bucket_name}/*"]
		}
	]
}