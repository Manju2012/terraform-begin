resource "local_file" "result" {
  filename = "implicit.txt"
  content = "Simple content from RP : ${random_string.name.id}"  # done ipmlicitly
  # depends_on = [ random_string.name.id ] # if required define explicitly
}

resource "random_string" "name" {
  length = 20
}



