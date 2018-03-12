require 'colorize'

def get_random_word()
	dictionary = File.readlines("5desk.txt")
	word = ""

	until(word.length > 5 && word.length < 12)
		random_line = rand(0..dictionary.size)
		word = dictionary[random_line]
	end
	return word
end

def draw_stickman(stage)
	case stage
	when 1
			puts %q{
   ____
  |    |
  |    
  |   
  |    
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 2
		puts %q{
   ____
  |    |
  |    o
  |   
  |    
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 3
		puts %q{
   ____
  |    |
  |    o
  |    |
  |    
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 4
		puts %q{
   ____
  |    |
  |    o
  |    |
  |    |
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 5
		puts %q{
   ____
  |    |
  |    o
  |   /|
  |    |
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 6
		puts %q{
   ____
  |    |
  |    o
  |   /|\
  |    |
  |   
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 7
		puts %q{
   ____
  |    |
  |    o
  |   /|\
  |    |
  |   /
 _|_
|   |______
|          |
|__________|
}.colorize(:green)
	when 8
puts %q{
   ____
  |    |
  |    o
  |   /|\
  |    |
  |   / \
 _|_
|   |______
|          |
|__________|
}.colorize(:red)
	end
end

word = get_random_word
stage = 1

until(stage == 9)
	draw_stickman(stage)
	stage += 1
end



