# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.exists?(email: "admin@ticketify.com")
  User.create!(email: "admin@ticketify.com", password: "password", admin: true)
end

unless User.exists?(email: "viewer@ticketify.com")
  User.create(email: "viewer@ticketify.com", password: "password")
end

["Visual Studio Code", "Opera Browser"].each do |name|
  unless Project.exists?(name: name)
  	Project.create!(name: name, description: "A sample project about #{name}")
  end
end
