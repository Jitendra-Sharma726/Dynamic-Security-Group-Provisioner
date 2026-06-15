# Create the S3 Bucket Registry
resource "aws_s3_bucket" "artifact_registry" {
  bucket = "company-artifact-registry"
}

# Upload the Packaged Artifact
resource "aws_s3_object" "frontend_release" {
  bucket = aws_s3_bucket.artifact_registry.id
  key    = "release.tar.gz"
  source = "./release.tar.gz"
}
