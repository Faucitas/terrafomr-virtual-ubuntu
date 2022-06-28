resource "aws_ecr_repository" "django_docker" {
  name                 = "django_docker"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_arn" {
  value = "${aws_ecr_repository.django_docker.arn}"
}