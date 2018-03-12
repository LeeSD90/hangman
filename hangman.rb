dictionary = File.readlines("5desk.txt")
word = ""
while(word.length < 5 || word.length > 12) do
	random_line = rand(0..dictionary.size)
	word = dictionary[random_line]
end
puts word