# AWS EC2 Docker Server

· Configures a Terraform AWS provider to assemble resources in AWS cloud. AWS credentials are stored locally using aws-vault.

· Creates an IAM assumed role with a policy to access ECR repositories that is used by the EC2 server.

· Builds a private ECR repository to store Docker images for use by the server.

· Provisions an EC2 server using a user-data bash script to install Docker and setup the aws-cli used to pull the appropriate Docker images from the ECR repository. Generates a security group to allow HTTP/HTTPS and SSH traffic.

· Institutes a PostgreSQL database using RDS with a security group that allows only traffic from the EC2 server’s security group.
