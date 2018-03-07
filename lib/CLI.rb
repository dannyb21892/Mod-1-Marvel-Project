require 'pry'
def welcome

  options = {"1" => "characters",
    "2" => "creators",
    "3" => "events",
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events"
  }

  puts "Welcome to the Marvel recommendation app."
  puts "Please choose which kind of object to search for: \n1: Characters\n2: Creators\n3: Events"
  type = gets.chomp
  #binding.pry
  while !options.keys.include?(type)
    "Please type 1, 2, or 3 and press return."
    type = gets.chomp
  end
  #binding.pry
  "aeiou".split('').include?(options[type][0]) ? thingy = "n" : thingy = ""
  puts "Please enter a#{thingy} #{options[type][0..-2]} to search for:"
  search_term = gets.chomp
  [options[type], search_term]
end

def cross_reference(first_input)
  options = {"1" => "characters",
    "2" => "creators",
    "3" => "events",
    "4" => false
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events",
    "Just the first one is fine" => false
  }
  puts "Would you like to cross reference #{first_input[1]} with another type of Marvel Entity?"
  puts "1: Characters\n 2: Creators\n3: Events\n4: Just the first one is fine"
  type = gets.chomp
  while !options.keys.include?(type)
    "Please type 1, 2, 3 or 4 and press return."
    type = gets.chomp
  end
  if !options[type]
    "aeiou".split('').include?(options[type][0]) ? thingy = "n" : thingy = ""
    puts "Please enter a#{thingy} #{options[type][0..-2]} to cross reference with #{first_input[1]}:"
    search_term = gets.chomp
  else
    search_term = nil
  end
  [options[type], search_term]

def information_request(user_input)
  if user_input[0] == "characters"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. What were the major Marvel Universe events that #{user_input[1]} participated in?"
    choice = gets.chomp
    choices = {"1" => "events"}
    return choices[choice]
  elsif user_input[0] == "events"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. Which Marvel creators worked on #{user_input[1]}?"
    puts "2. Which Marvel characters participated in #{user_input[1]}?"
    choice = gets.chomp
    choices = {"1" => "creators", "2" => "characters"}
    return choices[choice]
  elsif user_input[0]== "creators"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. Which Marvel events did #{user_input[1]} work on?"
    choice = gets.chomp
    choices = {"1" => "events"}
    return choices[choice]
  else
    puts "Invalid input."
  end
end

def return_info(user_input, type_of_response)
  relationship_hash = {
    "characters" => {"events" => "#{user_input[1]} participated in the following events:"},
    "events" => {"creators" => "#{user_input[1]} was worked on by the following creators:",
    "characters" => "#{user_input[1]} featured the following characters:"},
    "creators" => {"events" => "#{user_input[1]} worked on the following events:"}
  }
  puts relationship_hash[user_input[0]][type_of_response]
  class_hash = {"characters" => Character, "creators" => Creator, "events" => Event}
  array = class_hash[type_of_response].all.map do |object|
    object.name
  end
  puts array

end
