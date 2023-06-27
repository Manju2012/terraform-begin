data "local_file" "a1" {
  filename = "sample.txt"
}

output "o1" {
    value = data.local_file.a1.content
}