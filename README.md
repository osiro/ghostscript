# AWS Ghostscript

Yet another Ghostscript [Docker Container](https://hub.docker.com/r/osiro/ghostscript).

Docker image is ready for AWS Fargate, EKS or ECS.

It includes AWS Cli that can be use to pull/push files to/from S3 buckets.

# Usage

1. Assuming the there're files 1.pdf and 2.pdf in s3 bucket
2. Assuming you want to name the output pdf with the provided correlation id

```bash
docker-compose run -e BUCKET=vosiropdfmerger -e CORRELATIONID=123456 app bash -c "/src/proc.sh 1.pdf 2.pdf"
```
