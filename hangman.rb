dictionary = File.readlines("5desk.txt")
random_line = rand(0..dictionary.size)
word = dictionary[random_line]
puts word