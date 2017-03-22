# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.delete_all
Category.create("Mariage Passion Artistique Fete Commercial".split.map { |name| {name: name} })
Mediatype.delete_all
#Mediatype.create("Image Video".split.map { |name| {name: name} })
Mediatype.create(%w(Image Vidéo) .map { |name| {name: name} })
