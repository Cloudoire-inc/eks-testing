resource "aws_ecr_repository" "foo" {
  name                 = "we_travel_app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}