def get_random_word()
	dictionary = File.readlines("5desk.txt")
	word = ""

	until(word.length > 5 && word.length < 12)
		random_line = rand(0..dictionary.size)
		word = dictionary[random_line]
	end
	return word
end
1000.times{puts get_random_word()}

