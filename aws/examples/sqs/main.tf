#
# MAINTAINER Vitaliy Natarov "vitaliy.natarov@yahoo.com"
#
terraform {
  required_version = "> 0.9.0"
}
provider "aws" {
    region  = "us-east-1"
    # alias = "us-east-1"
    shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
     # access_key = "${var.aws_access_key}"
     # secret_key = "${var.aws_secret_key}"
}

module "sqs" {
    source                              = "../../modules/sqs"
    name                                = "TEST-SQS"
    environment                         = "PROD"

    #Enable Fifo
    #enable_fifo_queue           = true
    #content_based_deduplication = true
    
    #sqs_dead_letter_queue_arn   = "arn:aws:sqs:us-east-1:XXXXXXXXXXXXXXX:my_sqs"
}
