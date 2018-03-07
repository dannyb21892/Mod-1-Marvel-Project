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
  while !options.keys.include?(type)
    "Please type 1, 2, or 3 and press return."
    type = gets.chomp
  end
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
end
