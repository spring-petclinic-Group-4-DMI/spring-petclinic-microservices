output "repository_urls" {
  value = {
    for svc, repo in aws_ecr_repository.microservices :
    svc => repo.repository_url
  }
}

output "registry_url" {
  value = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
}

output "docker_login_command" {
  value = "aws ecr get-login-password --region ${data.aws_region.current.name} | docker login --username AWS --password-stdin ${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com"
}