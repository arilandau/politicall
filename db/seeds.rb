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
  chamber: "House",
  leadership_role: "Veep",
  twitter_account: "bestVeepEver",
  facebook_account: "bestVeepEver",
  email: "bestVeepEver@whitehouse.gov",
  url: "veep@veep.com",
  next_election: "2017",
  phone_number: "123-456-7890",
  state: "Maryland")

  Congressmember.create!(
    first_name: "Tony",
    last_name: "Soprano",
    party: "R",
    chamber: "House",
    leadership_role: "Big Boss",
    twitter_account: "fuggetaboutit",
    facebook_account: "fuggetaboutit",
    email: "bigtony@newjersey.gov",
    url: "bigtony.gov",
    next_election: "2017",
    phone_number: "123-456-7891",
    state: "New Jersey")

  Congressmember.create!(
    first_name: "Miss",
    last_name: "Piggy",
    party: "I",
    chamber: "House",
    leadership_role: "Diva",
    twitter_account: "misspiggy",
    facebook_account: "misspiggy",
    email: "misspiggy@newyork.gov",
    url: "misspiggy.gov",
    next_election: "2017",
    phone_number: "123-456-7892",
    state: "New York")

  Congressmember.create!(
    first_name: "Ceresi",
    last_name: "Lannister",
    party: "R",
    chamber: "Senate",
    leadership_role: "Queen",
    twitter_account: "bloodthirstyb*tch",
    facebook_account: "bloodthirstyb*tch",
    email: "queen@castlerock.gov",
    url: "queen.gov",
    next_election: "2017",
    phone_number: "123-456-7893",
    state: "Iowa")

  Congressmember.create!(
    first_name: "Spider",
    last_name: "Man",
    party: "D",
    chamber: "Senate",
    leadership_role: "",
    twitter_account: "",
    facebook_account: "",
    email: "spidey@montana.gov",
    url: "spidey.gov",
    next_election: "2017",
    phone_number: "123-456-7894",
    state: "Montana")

  Congressmember.create!(
    first_name: "Elizabeth",
    last_name: "Something",
    party: "I",
    chamber: "Senate",
    leadership_role: "Queen",
    twitter_account: "",
    facebook_account: "",
    email: "queen@virginia.gov",
    url: "anotherqueen.gov",
    next_election: "2017",
    phone_number: "123-456-7895",
    state: "Virginia")

User.create!(
  first_name: 'Lisa',
  last_name: 'Simpson',
  username: 'lisasimpson2020',
  email: 'lisasimpson2020@gmail.com',
  password: 'password',
  password_confirmation: 'password'
)
