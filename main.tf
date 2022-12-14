/*# Backend must remain commented until the Bucket
 and the DynamoDB table are created. 
 After the creation you can uncomment it,
 run "terraform init" and then "terraform apply" */

 /*terraform {
   backend "s3" {
     bucket         = "terraform-backend-statefile-dev"
     key            = "state/terraform.tfstate"
     region         = "us-east-1"
     dynamodb_table = "terraform-state-locks"
     encrypt        = "true"
     profile        = "default"
   }
 }*/

/*resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "vpc"
  }
}
*/