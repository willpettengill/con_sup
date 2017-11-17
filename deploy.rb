require "rubygems"
require 'yaml'
require 'right_aws'

bucket     = "petttest"
s3 = RightAws::S3Interface.new(access_key, secret_key)

headers = {
  "Content-disposition" => "inline",
  "x-amz-acl" => "public-read"
}

files_to_upload = []
files_to_upload << "index.html"
files_to_upload << "js/bootstrap.3.3.7.min.js"
files_to_upload << "css/spacelab.min.css"

files_to_upload.each do |f|
  s3.put(bucket, f, File.read(f))
end
