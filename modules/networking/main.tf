# data source: read-only lookup, doesn't create anything
data "aws_vpc" "default" {
  provider = aws.network
  default  = true
}

resource "aws_security_group" "web" {
  provider    = aws.network
  name        = "web-sg"
  description = "Allow SSH from allowed_ssh_cidr and HTTP from anywhere"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH from allowed CIDR"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "app" {
  provider    = aws.network
  name        = "app-sg"
  description = "Allow traffic on 8080 only from the web security group"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    # source is another SG's ID, not a CIDR — only instances carrying web-sg can reach this
    description     = "App port from web tier only"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_placement_group" "this" {
  provider = aws.network
  name     = "web-app-cluster-pg"
  strategy = "cluster" # requires every instance placed in it to share the same AZ
}
