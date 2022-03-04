resource "aws_ecr_repository" "test-task-repo-private" {
  name                 = "test-task-repo-private"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository_policy" "foopolicy" {
  repository = aws_ecr_repository.test-task-repo-private.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:CompleteLayerUpload",
                "ecr:GetDownloadUrlForLayer",
                "ecr:InitiateLayerUpload",
                "ecr:PutImage",
                "ecr:UploadLayerPart"
            ]
        }
    ]
}
EOF
}