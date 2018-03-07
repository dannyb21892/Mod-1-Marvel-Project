require_relative '../config/environment'
require_relative '../lib/json_parsing'

char = welcome
url = get_api_URL(char)
#puts url

response = RestClient.get(url)
json = JSON.parse(response)
binding.pry
print_blurb(json)

#binding.pry


#test
#dan's test!
