def concat(word, ind)
	#This is used by the pig latin translate method.

	#1. Gather the first (ind-1) letters
	bunch = word[0..ind-1]
	#2. Delete them from the beginning
	word[0..ind-1] = ''
	#3. Move them to the end and add the pig latin "ay"
	word << bunch + 'ay'
end

def translate(phrase)
	words = phrase.split
	words = words.each do |word|
		#If the word starts with a vowel...
		#(e.g. "apple")
		if (word[0] =~ /[aeiou]/) == 0
			#...then just add 'ay' to the end.
			word << 'ay'


		#If the word starts with three consonants...
		#(e.g. "school")
		elsif (word =~ /\A(?i:(?![aeiou])[a-z]){3}/) == 0
			#...then run concat on first three characters.
			concat(word,3)


		#If the word starts with two consonants...
		elsif (word =~ /\A(?i:(?![aeiou])[a-z]){2}/) == 0

			#...AND if the second letter is q...
			#(e.g. "square")
			if word[1]=='q'
				#...then run concat on first three characters.
				concat(word,3)

			else
				#...otherwise run concat on first two characters.
				#(e.g. "cherry")
				concat(word,2)
			end


		#If the word starts with "qu"...
		#(e.g. "quiet")
		elsif word[0..1] == 'qu'
			#...then run concat on first two characters.
			concat(word,2)


		#If all else fails, and the first letter of the word is a consonant...
		#(e.g. "pie")
		elsif (word[0] =~ /[^aeiou]/) == 0
				#...then run concat on the first character.
				concat(word,1)
		end
	end

	#Convert back into a string and return.
	return words.join(' ')
end