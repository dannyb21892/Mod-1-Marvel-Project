require_relative '../config/environment'
require_relative '../lib/json_parsing'

user_input = welcome
url = get_api_URL(user_input)

response = RestClient.get(url)
json = JSON.parse(response)

seed_db(json, user_input)

secondary_input = cross_reference(user_input)
if secondary_input[0]
  secondary_url = get_api_URL(secondary_input)

  secondary_response = RestClient.get(url)
  secondary_json = JSON.parse(response)
  seed_db(secondary_json, secondary_input)
else
  type_of_response = information_request
  return_info(user_input, type_of_response)
end




binding.pry

print_blurb(json)

type_of_response = information_request(user_input)
return_info(user_input, type_of_response)
