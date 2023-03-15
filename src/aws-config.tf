resource "aws_config_configuration_recorder" "config_recorder" {
  name = "my-config-recorder"
#   role_arn = aws_iam_role.config_role.arn
#   role_arn = "arn:aws:iam::058616502631:role/aws-controltower-ConfigRecorderRole"
  role_arn = "arn:aws:iam::058616502631:role/aws-service-role/config-conforms.amazonaws.com/AWSServiceRoleForConfigConforms"
  recording_group {
    all_supported = true
    include_global_resource_types = true
  }
}

# resource "aws_iam_role" "config_role" {
#   name = "my-config-role"
#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Effect = "Allow"
#         Principal = {
#           Service = "config.amazonaws.com"
#         }
#       }
#     ]
#   })
# }

# resource "aws_iam_role_policy" "config_policy" {
#   name = "my-config-policy"
#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         # Action = [
#         #   "s3:GetBucketAcl",
#         # #   "s3:PutBucketAcl",
#         #   "s3:GetBucketPolicy",
#         # #   "s3:PutBucketPolicy" applyu
#         # ]
#         Action   = [
#           "s3:GetBucketAcl",
#           "s3:PutBucketAcl",
#           "s3:GetBucketPolicy",
#           "s3:PutBucketPolicy",
#         #   "config:PutConfigurationRecorder",
#         #   "config:StartConfigurationRecorder",
#         #   "config:StopConfigurationRecorder",
#         #   "config:DeleteConfigurationRecorder",
#         #   "config:DescribeConfigurationRecorders"
#         ]
#         Resource = "*"
#       }
#     ]
#   })
#   role = aws_iam_role.config_role.name
# }

# resource "aws_iam_role_policy_attachment" "config_policy_attach" {
# #   policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRoleForOrganizations"
#   policy_arn = "arn:aws:iam::aws:policy/AWSConfigUserAccess"
#   role = aws_iam_role.config_role.name
# }

# resource "aws_s3_bucket" "config_bucket" {
#   bucket = "my-config-bucket"
#   acl = "private"
#   tags = {
#     Name = "my-config-bucket"
#   }
# }

resource "aws_s3_bucket" "aws-config" {
    bucket = "config-bucket-331"
    # acl = "private"

    # versioning {
    #     enabled =true
    }
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.aws-config.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_acl" "aws-config_acl" {
  bucket = aws_s3_bucket.aws-config.id
  acl    = "private"
}
