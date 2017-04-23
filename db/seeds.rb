# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Type.create!(name: 'Picture')
Type.create!(name: 'Video')
Captcha.create!(activate: false)

#Category.delete_all
#Category.create("Reportages AfterMovies Commerciales Mariages Creations".split.map { |name| {name: name} })

Carrousel.create(image1: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_1_750_350_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_1_1220_500_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_1_1520_550_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_1_1920_624_000000.png"))

Carrousel.create(image1: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_2_750_350_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_2_1220_500_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_2_1520_550_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_2_1920_624_000000.png"))

Carrousel.create(image1: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_3_750_350_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_3_1220_500_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_3_1520_550_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Carrousel/carrousel_3_1920_624_000000.png"))

Category.create( name: "Reportages",
    image1: File.new("#{Rails.root}/app/assets/images/Themes/Theme_1_reportages_736_200_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Themes/Theme_1_reportages_640_200_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Themes/Theme_1_reportages_288_200_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Themes/Theme_1_reportages_922_200_000000.png"))

Category.create( name: "Aftermovies",
    image1: File.new("#{Rails.root}/app/assets/images/Themes/Theme_2_aftermovies_736_200_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Themes/Theme_2_aftermovies_640_200_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Themes/Theme_2_aftermovies_288_200_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Themes/Theme_2_aftermovies_922_200_000000.png"))

Category.create( name: "Commerciales",
    image1: File.new("#{Rails.root}/app/assets/images/Themes/Theme_3_commerciales_736_200_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Themes/Theme_3_commerciales_640_200_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Themes/Theme_3_commerciales_288_200_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Themes/Theme_3_commerciales_922_200_000000.png"))

Category.create( name: "Mariages",
    image1: File.new("#{Rails.root}/app/assets/images/Themes/Theme_4_mariages_736_200_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Themes/Theme_4_mariages_640_200_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Themes/Theme_4_mariages_288_200_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Themes/Theme_4_mariages_922_200_000000.png"))

Category.create( name: "Creations",
    image1: File.new("#{Rails.root}/app/assets/images/Themes/Theme_5_creations_736_200_000000.png"),
    image2: File.new("#{Rails.root}/app/assets/images/Themes/Theme_5_creations_640_200_000000.png"),
    image3: File.new("#{Rails.root}/app/assets/images/Themes/Theme_5_creations_288_200_000000.png"),
    image4: File.new("#{Rails.root}/app/assets/images/Themes/Theme_5_creations_992_200_000000.png"))