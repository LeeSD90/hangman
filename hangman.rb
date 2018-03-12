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

#todo only increment stage on unsuccessful guess
def draw_score(stage)
	puts "\n"
	@word.split("").each { |l|
		if @chosen_letters.include?(l.downcase) then print l + " "
		else print "_ "
		end
	} 
	puts "\n\n"
	puts "So far you have guessed - " + @chosen_letters.to_s.colorize(:green)
	puts "You have "+(8-stage).to_s+" guesses remaining!\n"
end

def check_input(input)
	return is_letter(input) && !@chosen_letters.include?(input)
end

def is_letter(l)
	return l =~ /^[a-zA-Z]{1}$/
end

@word = get_random_word.gsub("\n", '')
@chosen_letters = []
stage = 1
draw_score(stage)

until(stage == 8)
	puts @word #todo remove
	input = ""

	until (check_input(input))
		puts "Please guess a character a-z which you haven't already tried"
		input = gets.chomp.downcase
	end
	system "cls"

	stage += 1 unless @word.downcase.include?input
	
	@chosen_letters.push(input)
	draw_stickman(stage)
	draw_score(stage)
	
end



