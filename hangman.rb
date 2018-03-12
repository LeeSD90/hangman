require 'colorize'
require 'yaml'

class Hangman

	def initialize
		instructions
		menu
	end

	private

	def get_random_word()
		dictionary = File.readlines("5desk.txt")
		word = ""

		until(word.length > 5 && word.length < 12)
			random_line = rand(0..dictionary.size)
			word = dictionary[random_line]
		end
		return word
	end

	def score(stage)
		count = 0
		puts "\n"
		@word.split("").each { |l|
			if @chosen_letters.include?(l.downcase) then count += 1; print l + " "
			else print "_ "
			end
		}
		if @word.split("").length == count then return true end
		puts "\n\n"
		puts "So far you have guessed - " + @chosen_letters.to_s.colorize(:green)
		puts "You have "+(8-stage).to_s+" guesses remaining!\n"
		return false
	end

	def check_input(input)
		return is_letter(input) && !@chosen_letters.include?(input)
	end

	def is_letter(l)
		return l =~ /^[a-zA-Z]{1}$/
	end

	def instructions()
		puts "\n"
	    puts "|***** Hangman! *****|".colorize(:green)
	    puts "\nA random English word has been chosen from a dictionary. You have eight incorrect guesses before you fail!\n\n"
	end

	def menu()
		puts "(1)New game".colorize(:red)
		puts "(2)Load game".colorize(:red)
		puts "(3)Exit".colorize(:red)
		menu_input
	end

	def menu_input
		input = gets.chomp.downcase
		case input
		when "1"
			new_game
		when "2"
			load_game
		when "3"
			exit
		else 
			puts "Please select an option\n"
			menu_input
		end
	end

	def new_game()
		@word = get_random_word.gsub("\n", '')
		@chosen_letters = []
		system "cls"
		stage = 1
		draw_stickman(stage)
		score(stage)
		won = false

		until(stage == 8 || won)
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
			won = score(stage)
		end

		puts won ? "\nYou won!".colorize(:green) : "\nYou lost!".colorize(:red)
	end

	def load_game()
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
end


Hangman.new