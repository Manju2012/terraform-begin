resource "local_file" "rand_res" {
  filename = "abc.txt"
  content = "Simple content"
}

resource "random_string" "rand_name" {
  length = 20
}