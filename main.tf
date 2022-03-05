resource "aws_kms_replica_key" "pscloud-kms-key-replica" {

   primary_key_arn         = var.pscloud_primary_key_arn
   description             = "Multi-Region replica key"

  tags = {
    Name          = "${var.pscloud_company}_kms_key_${var.pscloud_env}"
    Project       = var.pscloud_project
  }
}

resource "aws_kms_alias" "pscloud-kms-key-alias" {
  name            = "alias/${var.pscloud_company}_kms_key_${var.pscloud_env}_${var.pscloud_project}"
  target_key_id   = aws_kms_key.pscloud-kms-key-replica.id
}
