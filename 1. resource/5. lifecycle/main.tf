resource "random_integer" "r1" {
  min = 01
  max = 10

        lifecycle {
        #   create_before_destroy = true
        # prevent_destroy = true
        ignore_changes = [ min ]

        }

}