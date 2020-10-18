﻿#    _____        _        _                    
#   |  __ \      | |      | |                   
#   | |  | | __ _| |_ __ _| |__   __ _ ___  ___ 
#   | |  | |/ _` | __/ _` | '_ \ / _` / __|/ _ \
#   | |__| | (_| | || (_| | |_) | (_| \__ \  __/
#   |_____/ \__,_|\__\__,_|_.__/ \__,_|___/\___|

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster

resource "aws_rds_cluster" "k3s" {
  count                           = local.deploy_rds
  cluster_identifier_prefix       = "${local.name}-"
  engine                          = "aurora-postgresql"
  engine_mode                     = "provisioned"
  engine_version                  = "10.7"
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.k3s.0.name
  availability_zones              = local.aws_azs
  database_name                   = var.database_name
  master_username                 = var.database_master_username
  master_password                 = var.database_master_password
  preferred_maintenance_window    = "fri:11:21-fri:11:51"
  db_subnet_group_name            = aws_db_subnet_group.private.0.id
  vpc_security_group_ids          = [aws_security_group.database.id]
  storage_encrypted               = true

  preferred_backup_window   = "11:52-19:52"
  backup_retention_period   = 30
  copy_tags_to_snapshot     = true
  deletion_protection       = false
  skip_final_snapshot       = local.skip_final_snapshot ? true : false
  final_snapshot_identifier = local.skip_final_snapshot ? null : "${local.name}-final-snapshot"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/rds_cluster_instance

resource "aws_rds_cluster_instance" "k3s" {
  count                = local.db_node_count
  identifier_prefix    = "${local.name}-${count.index}"
  cluster_identifier   = aws_rds_cluster.k3s.0.id
  engine               = "aurora-postgresql"
  instance_class       = local.db_instance_type
  db_subnet_group_name = aws_db_subnet_group.private.0.id
}
