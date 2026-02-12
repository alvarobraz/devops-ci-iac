resource "aws_ecr_repository" "devops-ci-iac-alvaro-0226" {
  name = "devops-ci-iac-alvaro-0226"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    IAC = "true"
  }
}