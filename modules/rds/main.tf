resource "aws_db_subnet_group" "db-subnet" {
name = "wetravel-db-subnet-group"
subnet_ids = var.subnet_ids

}

resource "aws_security_group" "allow_rds" {
  name        = "wetravelrds"
  description = "wetravelrds"
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_rds_cluster" "default" {
  allocated_storage       = 60
  cluster_identifier      = "tf-rds-wetravel"
  engine                  = "mysql"
  engine_version          = "8.0.28"
  db_subnet_group_name = aws_db_subnet_group.db-subnet.name
  database_name           = var.db_name
  master_username         = var.db_user
  master_password         = var.db_password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
}

# resource "aws_db_instance" "rds_instance" {
#   allocated_storage    = 20
#   identifier           = "tf-rds-wetravel"
#   storage_type         = "gp2"
#   engine               = "mysql"
#   engine_version       = "8.0.28"
#   instance_class       = "db.t2.micro"
#   db_name              = "wetravel"
#   username             = "admin"
#   password             = "adM!n2022"
#   multi_az             = true
#   db_subnet_group_name = aws_db_subnet_group.db-subnet.name
#   publicly_accessible  = true
#   skip_final_snapshot  = true
#   vpc_security_group_ids = [ aws_security_group.allow_rds.id ]

#   tags = {
#     Name = "WeTravel_Task-db"
#   }
# #   depends_on = [
# #     aws_subnet.public-eu-central-1a,aws_subnet.public-eu-central-1b
# #   ]

# }
