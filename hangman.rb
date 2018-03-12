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

#todo error check userinput -> chars only & not already guessed
#todo only increment stage on unsuccessful guess
def draw_score(stage)
	puts "\n"
	@word.split("").each { |l|
		if @chosen_letters.include?(l) then print l + " "
		else print "_ "
		end
	} 
	puts "\n\n"
	puts "So far you have guessed - " + @chosen_letters.to_s.colorize(:green)
	puts "You have "+(8-stage).to_s+" guesses remaining!\n"
end

@word = get_random_word.gsub("\n", '')
@chosen_letters = []
stage = 1

until(stage == 8)
	puts @word #todo remove
	guess = gets.chomp
	@chosen_letters.push(guess)
	draw_stickman(stage)
	draw_score(stage)
	stage += 1
end



