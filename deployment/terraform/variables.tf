variable "static_bucket_name" {  // name of bucket used for static files
  default = "dogcat-static"
}

variable "media_bucket_name" {   // name of bucket used for media files
  default = "dogcat-media"
}

variable "ssh_pub_key" { // path to pub ssh key used for access to instance

}
