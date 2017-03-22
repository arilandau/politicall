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
  first_name: "Selina",
  last_name: "Meyer",
  party: "D",
  chamber: "House",
  leadership_role: "Veep",
  twitter_account: "bestVeepEver",
  facebook_account: "bestVeepEver",
  email: "bestVeepEver@whitehouse.gov",
  url: "whitehouse.gov",
  next_election: "2017",
  phone_number: "212-222-7077",
  state: "Maryland",
  photo: "http://cdn.skim.gs/images/pddcwzwwa6fktomdsnht/veeps-selina-meyer-and-other-female-tv-presidents-you-probably-forgot")

  Congressmember.create!(
    first_name: "Tony",
    last_name: "Soprano",
    party: "R",
    chamber: "House",
    leadership_role: "Big Boss",
    twitter_account: "fuggetaboutit",
    facebook_account: "fuggetaboutit",
    email: "yahoo@yahoo.com",
    url: "yahoo.com",
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
    email: "piggy@gmail.com",
    url: "google.com",
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
    url: "horizon.com",
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
    email: "nypl@nypl.org",
    url: "nypl.org",
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
    url: "nbc.com",
    next_election: "2017",
    phone_number: "123-456-7895",
    state: "Virginia")

  User.create!(
    first_name: 'Lisa',
    last_name: 'Simpson',
    username: 'lisasimpson2020',
    email: 'lisasimpson2020@gmail.com',
    password: 'password',
    password_confirmation: 'password',
    role: 'admin'
  )

  User.create!(
    first_name: 'Bart',
    last_name: 'Simpson',
    username: 'bsimpson20never',
    email: 'bsimpson20never@gmail.com',
    password: 'password',
    password_confirmation: 'password'
  )
