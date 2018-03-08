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
    "4" => false,
    "Characters" => "characters",
    "Creators" => "creators",
    "Events" => "events",
    "Just the first one is fine" => false
  }
  puts "Would you like to cross reference #{first_input[1]} with another type of Marvel Entity?"
  puts "1: Characters\n2: Creators\n3: Events\n4: Just the first one is fine"
  type = gets.chomp
  while !options.keys.include?(type)
    "Please type 1, 2, 3 or 4 and press return."
    type = gets.chomp
  end
  if options[type]
    "aeiou".split('').include?(options[type][0]) ? thingy = "n" : thingy = ""
    puts "Please enter a#{thingy} #{options[type][0..-2]} to cross reference with #{first_input[1]}:"
    search_term = gets.chomp
  else
    search_term = nil
  end
  [options[type], search_term]
end

def information_request(user_input)
  if user_input[0] == "characters"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. What were the major Marvel Universe events that #{user_input[1]} participated in?"
    puts "2. What were the issues that featured #{user_input[1]}?"
    choice = gets.chomp
    choices = {"1" => "events", "2" => "comics"}
    return choices[choice]
  elsif user_input[0] == "events"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. Which Marvel creators worked on #{user_input[1]}?"
    puts "2. Which Marvel characters participated in #{user_input[1]}?"
    puts "3. What issues make up #{user_input[1]}?"
    choice = gets.chomp
    choices = {"1" => "creators", "2" => "characters", "3" => "comics"}
    return choices[choice]
  elsif user_input[0]== "creators"
    puts "\n"
    puts "Please select the number of a question:"
    puts "1. Which Marvel events did #{user_input[1]} work on?"
    puts "2. Which issues did #{user_input[1]} work on?"
    choice = gets.chomp
    choices = {"1" => "events", "2" => "comics"}
    return choices[choice]
  else
    puts "Invalid input."
  end
end

def return_info(user_input, type_of_response)
  user_input[0].class == Array ? cross_ref = 1 : cross_ref = 0
  class_hash = {"characters" => Character, "creators" => Creator, "events" => Event, "comics" => Comic}

  if cross_ref == 0 #singular input to search by
    relationship_hash = {
      "characters" => {"events" => "#{user_input[1]} participated in the following events:",
                      "comics" => "#{user_input[1]} was featured in the following issues:"},
      "events" => {"creators" => "#{user_input[1]} was worked on by the following creators:",
                  "comics" => "#{user_input[1]} is made up of the following issues:",
                  "characters" => "#{user_input[1]} featured the following characters:"},
      "creators" => {"events" => "#{user_input[1]} worked on the following events:",
                    "comics" => "#{user_input[1]} worked on the following issues:"}
    }
    puts relationship_hash[user_input[0]][type_of_response]
    array = class_hash[type_of_response].all.map do |object|
      object.name
    end
    puts array

  else #cross referencing two inputs
    a = class_hash[user_input[0][0]].find_by name: user_input[0][1] #first user object
    b = class_hash[user_input[1][0]].find_by name: user_input[1][1] #second user object
    puts "#{a.name} and #{b.name} have the following in common:"
    class_hash.keys.each do |attribute|
      begin #using begin/rescue to check all class/attribute combos without throwing errors when a combo doesnt exist
        a.send(attribute)
        b.send(attribute)
        commonalities = class_hash[attribute].all.select do |object|
          a.send(attribute).include?(object) && b.send(attribute).include?(object)
        end
        if commonalities != []
          puts "#{attribute.capitalize}:"
          commonalities.each_with_index{|common, i| puts "#{i+1}: #{common.name}"}
        end
      rescue
      end
    end
  end
end
