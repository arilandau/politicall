require 'uri'
require 'rest-client'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Congressmember.destroy_all
User.destroy_all
List.destroy_all
Congresslist.destroy_all

response = RestClient.get('https://api.propublica.org/congress/v1/115/house/members.json', :content_type => :json, :'x-api-key' => '2CfscDX7yY4X5u2yqh2QQ5V2dFn9cyy75g1o0smi')
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
    state: c['state']
  )
end

response = RestClient.get('https://api.propublica.org/congress/v1/115/senate/members.json', :content_type => :json, :'x-api-key' => '2CfscDX7yY4X5u2yqh2QQ5V2dFn9cyy75g1o0smi')
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
    state: c['state']
  )
end
