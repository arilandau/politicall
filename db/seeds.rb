# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Congressmember.destroy_all
User.destroy_all

Congressmember.create!(
  first_name: "Selena",
  last_name: "Meyer",
  party: "D",
  leadership_role: "Veep",
  twitter_account: "bestVeepEver",
  facebook_account: "bestVeepEver",
  email: "bestVeepEver@whitehouse.gov",
  url: "veep@veep.com",
  next_election: "2017",
  phone_number: "123-456-7890",
  state: "MD")

User.create!(
  first_name: 'Lisa',
  last_name: 'Simpson',
  username: 'lisasimpson2020',
  email: 'lisasimpson2020@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
