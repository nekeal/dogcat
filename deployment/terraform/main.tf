resource "aws_security_group" "sshhttp" {
  name = "allow_ssh_http"
  description = "Allow Http and SSH traffice"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}

resource "aws_key_pair" "deployer" {
  key_name = "deployer-key"
  public_key = file(var.ssh_pub_key)
}

resource "aws_iam_role" "s3access" {
  name = "s3access"
  assume_role_policy =<<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "ec2_to_s3_access" {
  name = "ec2_to_s3_access"
  role = aws_iam_role.s3access.name
}

resource "aws_iam_role_policy" "s3access" {
  name = "s3_access_policy"
  role = aws_iam_role.s3access.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "s3:GetObjectAcl",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:DeleteObject",
        "s3:PutObjectAcl"
      ],
      "Effect": "Allow",
      "Resource": [
      "arn:aws:s3:::${var.static_bucket_name}",
      "arn:aws:s3:::${var.static_bucket_name}/*",
      "arn:aws:s3:::${var.media_bucket_name}",
      "arn:aws:s3:::${var.media_bucket_name}/*"
      ]
    }
  ]
}
EOF
}

resource "aws_instance" "web" {
  ami = "ami-07ebfd5b3428b6f4d"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  security_groups = [aws_security_group.sshhttp.name]
  iam_instance_profile = aws_iam_instance_profile.ec2_to_s3_access.id
}

resource "aws_iam_user" "deployer" {
  name = "deployer"

  tags = {
    description = "Deployer of AWS resources"
  }
}

data "template_file" "static-bucket-policy" {
  template = file("buckets-policy.json.tpl")
  vars = {
    bucket_name = var.static_bucket_name
    user_arn = aws_iam_user.deployer.arn
  }
}

data "template_file" "media-bucket-policy" {
  template = file("buckets-policy.json.tpl")
  vars = {
    bucket_name = var.media_bucket_name
    user_arn = aws_iam_user.deployer.arn
  }
}

resource "aws_s3_bucket" "static" {
  bucket = var.static_bucket_name
  policy = data.template_file.static-bucket-policy.rendered
  force_destroy = true

}

resource "aws_s3_bucket" "media" {
  bucket = var.media_bucket_name
  policy = data.template_file.media-bucket-policy.rendered
  force_destroy = true
}

output "policy" {
   value = aws_instance.web.public_dns
}
