config {
  module = true
  force = false
  disabled_by_default = false
}

plugin "aws" {
  enabled = true
  deep_check = true
  region = "ap-northeast-1"
}
