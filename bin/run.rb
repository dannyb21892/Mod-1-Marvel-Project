require_relative '../config/environment'
require_relative '../lib/json_parsing'

user_input = welcome
url = get_api_URL(user_input)
#puts url

response = RestClient.get(url)
json = JSON.parse(response)
binding.pry
print_blurb(json)

#binding.pry


#test
#dan's test!
