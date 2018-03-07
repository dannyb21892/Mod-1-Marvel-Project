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

def seed_db(json, input)
  inputhash = {"characters" => Character, "creators" => Creator, "events" => Event}
  klass = inputhash[input[0]]

  results = json["data"]["results"][0]

  input_object = klass.new
  attributes = input_object.attributes

  input_object.name = results["name"]
  input_object.send(attributes.keys[2] + "=",results["id"])
  input_object.save
end
