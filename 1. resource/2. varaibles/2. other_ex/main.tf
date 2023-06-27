resource "local_file" "sample_res" {
  filename = var.filename
  content = var.bool_content    # non list
 
}



resource "local_file" "sample_res1" {
  filename = var.filename
  content = var.list_content[1]   # list
}


resource "local_file" "sample_res2" {
  filename = var.filename1
  content = var.tuple_content[1]   # tuple
}



resource "local_file" "sample_res3" {
  filename = var.filename2
  content = var.map_content["name"]
}