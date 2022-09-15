output "public-eu-central-1a" {
  value = aws_subnet.public-eu-central-1a.id
}
output "public-eu-central-1b" {
  value = aws_subnet.public-eu-central-1b.id
}
output "public-eu-central-1c" {
  value = aws_subnet.public-eu-central-1c.id
}
output "private-eu-central-1a" {
  value = aws_subnet.private-eu-central-1a.id
}
output "private-eu-central-1b" {
  value = aws_subnet.private-eu-central-1b.id
}
output "private-eu-central-1c" {
  value = aws_subnet.private-eu-central-1c.id
}
output "cidr_block" {
  value = aws_vpc.main.cidr_block
}
output "vpc_id" {
  value = aws_vpc.main.id
}