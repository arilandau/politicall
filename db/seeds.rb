require 'uri'
require 'rest-client'
require 'dotenv-rails'

def abbr_to_state(input)
  states = [
    ['Arizona', 'AZ'],
    ['Alabama', 'AL'],
    ['Alaska', 'AK'],
    ['American Samoa','AS'],
    ['Arizona', 'AZ'],
    ['Arkansas', 'AR'],
    ['California', 'CA'],
    ['Colorado', 'CO'],
    ['Connecticut', 'CT'],
    ['District of Columbia', 'DC'],
    ['Delaware', 'DE'],
    ['Florida', 'FL'],
    ['Georgia', 'GA'],
    ['Guam', 'GU'],
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
    ['Northern Marianas', 'MP'],
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
    ['Puerto Rico', 'PR'],
    ['Rhode Island', 'RI'],
    ['South Carolina', 'SC'],
    ['South Dakota', 'SD'],
    ['Tennessee', 'TN'],
    ['Texas', 'TX'],
    ['Utah', 'UT'],
    ['Vermont', 'VT'],
    ['Virginia', 'VA'],
    ['U.S. Virgin Islands', 'VI'],
    ['Washington', 'WA'],
    ['West Virginia', 'WV'],
    ['Wisconsin', 'WI'],
    ['Wyoming', 'WY'],
  ]

  states.each do |state|
    return state[0] if state[1] == input
  end
end

def full_name(first_name, last_name)
  first_name + " " + last_name
end

def party(initial)
  if initial == 'D'
    'Democrat'
  elsif initial == 'I'
    'Independent'
  elsif initial == 'R'
    'Republican'
  else
    'Unknown'
  end
end

def check_for_Kilili(name)
  if name.include?('Gregorio &#39;Kilili&#39;')
    return 'Gregorio'
  else
    return name
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
    full_name: check_for_Kilili(full_name(c['first_name'], c['last_name'])),
    party: party(c['party']),
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
    full_name: full_name(c['first_name'], c['last_name']),
    party: party(c['party']),
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
