# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create! name: "Alimentos", description: "Comida saludable"
User.create! name: "Yerko", encrypted_password: "$2a$10$9L/ocoNT0NcMLPRe3F8G2O9EoXdWRc8lFXnIZG8orT4kGN55WSS0.", email: "yerko.pino@usach.cl", sign_in_count: 1