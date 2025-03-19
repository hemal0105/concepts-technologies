resource "local_file" "pet" {
  filename = "data/pets.txt"
  content = "We love pets!"
}