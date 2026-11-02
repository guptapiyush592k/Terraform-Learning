
resource "github_repository" "terraform-first-github-repo" {
  name        = "first-repo-from-terraform"
  description = "My first repo created using terraform"
  visibility  = "public"
  auto_init   = true
}

# resource "github_repository" "terraform-second-github-repo" {
#   name        = "second-repo-from-terraform"
#   description = "My second repo created using terraform"
#   visibility = "public"
#   auto_init = true
# }

output "terraform-first-github-repo-url" {
  value = github_repository.terraform-first-github-repo.html_url
}