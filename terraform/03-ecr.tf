resource "aws_ecr_repository" "test-task-repo-private" {
  name                 = "test-task-repo-private"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecrpublic_repository" "test-task-repo-public" {
  repository_name   = "test-task-repo-public"
}