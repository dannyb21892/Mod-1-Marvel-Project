require_relative '../config/environment'
require_relative '../lib/json_parsing'

user_input = welcome
url = get_api_URL(user_input)

response = RestClient.get(url)
json = JSON.parse(response)

seed_db(json, user_input)

binding.pry

print_blurb(json)

type_of_response = information_request(user_input)
return_info(user_input, type_of_response)
