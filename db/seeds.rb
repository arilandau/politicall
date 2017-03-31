require 'uri'
require 'rest-client'
require 'dotenv-rails'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def abbr_to_state(input)
  states = [
    ['Arizona', 'AZ'],
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['Delaware', 'DE'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Hawaii', 'HI'],
    ['Idaho', 'ID'],
    ['Illinois', 'IL'],
    ['Indiana', 'IN'],
    ['Iowa', 'IA'],
    ['Kansas', 'KS'],
    ['Kentucky', 'KY'],
    ['Kentucky', 'KY'],
    ['Louisiana', 'LA'],
    ['Maine', 'ME'],
    ['Maryland', 'MD'],
    ['Massachusetts', 'MA'],
    ['Michigan', 'MI'],
    ['Minnesota', 'MN'],
    ['Mississippi', 'MS'],
    ['Missouri', 'MO'],
    ['Montana', 'MT'],
    ['Nebraska', 'NE'],
    ['Nevada', 'NV'],
    ['New Hampshire', 'NH'],
    ['New Jersey', 'NJ'],
    ['New Mexico', 'NM'],
    ['New York', 'NY'],
    ['North Carolina', 'NC'],
    ['North Dakota', 'ND'],
    ['Ohio', 'OH'],
    ['Oklahoma', 'OK'],
    ['Oregon', 'OR'],
    ['Pennsylvania', 'PA'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY'],
  ]

  states.each do |state|
    return state[0] if state[1] == input
  end
end

Congressmember.destroy_all
User.destroy_all
List.destroy_all
Congresslist.destroy_all

response = RestClient.get('https://api.propublica.org/congress/v1/115/house/members.json', :content_type => :json, :'x-api-key' => ENV['PROPUBLICA_API_KEY'])
house = JSON.parse(response)
house['results'][0]['members'].each do |c|
  Congressmember.create!(
    first_name: c['first_name'],
    middle_name: c['middle_name'],
    last_name: c['last_name'],
    party: c['party'],
    chamber: 'House',
    leadership_role: c['leadership_role'],
    twitter_account: c['twitter_account'],
    facebook_account: c['facebook_account'],
    email: c['email'],
    url: c['url'],
    senority: c['senority'],
    next_election: c['next_election'],
    phone: c['phone'],
    state: abbr_to_state(c['state'])
  )
end

response = RestClient.get('https://api.propublica.org/congress/v1/115/senate/members.json', :content_type => :json, :'x-api-key' => ENV['PROPUBLICA_API_KEY'])
senate = JSON.parse(response)
senate['results'][0]['members'].each do |c|
  Congressmember.create!(
    first_name: c['first_name'],
    middle_name: c['middle_name'],
    last_name: c['last_name'],
    party: c['party'],
    chamber: 'Senate',
    leadership_role: c['leadership_role'],
    twitter_account: c['twitter_account'],
    facebook_account: c['facebook_account'],
    email: c['email'],
    url: c['url'],
    senority: c['senority'],
    next_election: c['next_election'],
    phone: c['phone'],
    state: abbr_to_state(c['state'])
  )
end
