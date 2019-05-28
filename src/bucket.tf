data "aws_caller_identity" "current" {
}

module "encrypted_bucket" {
  source  = "infrablocks/encrypted-bucket/aws"
  version = "~> 0.1.12"

  bucket_name = "${var.bucket_base_name}-${data.aws_caller_identity.current.account_id}"

  tags = {
    Name               = "${var.bucket_base_name}-${data.aws_caller_identity.current.account_id}"
    InstanceIdentifier = var.instance_identifier
    EnvironmentName    = var.environment_name
  }
}

