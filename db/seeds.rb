# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |i|
  Point.create(
    title: Time.now.strftime("%Y%m%d.txt"), 
    lat: 53.956414 + 0.005 / (i+1), 
    lon: 27.617928 + 0.005 / (i+1), 
    altitude: 250 + rand(i), 
    direction: 360 - rand(i*10), 
    params: nil
  )
end