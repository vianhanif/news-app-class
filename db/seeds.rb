# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.find_or_create_by!(name: 'Admin', level: 1)
Role.find_or_create_by!(name: 'User', level: 2)
User.create(name: "Alvian Rahman Hanif", email: "admin@email.com", password: 'abc12345', password_confirmation: 'abc12345', role_id: 1)
