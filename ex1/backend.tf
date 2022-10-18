terraform {
  backend "s3" {
    bucket = "devws-tf-state-bucket"
    key    = "demo/env/terrafom.tfstate"
    region = "us-east-1"
   }
}