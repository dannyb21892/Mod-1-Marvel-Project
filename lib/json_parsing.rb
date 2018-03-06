require "pry"

def print_blurb(json)
  if json["data"]["results"][0]["resourceURI"].include?("creators")
    puts "\n#{json["data"]["results"][0]["fullName"]}, creator at Marvel Comics."
  elsif json["data"]["results"][0]["resourceURI"].include?("characters")
    puts "\n#{json["data"]["results"][0]["name"]}"
    puts json["data"]["results"][0]["description"]
  else
    puts "\n#{json["data"]["results"][0]["title"]}"
    puts json["data"]["results"][0]["description"]
  end
end

#binding.pry
