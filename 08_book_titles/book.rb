class Book
	def title=(phrase)
=begin
		words = phrase.scan(/\w+/)
		titlea = []

		words.each_index do |i|
			if i==0 #Always capitalize the first word, regardless of type
				titlea << words[0].capitalize
				next
			end
			#If the word is a "little word" according to the test cases
			#Need to find out why the "ORs" don't work as expected
			if words[i] == 'the' || words[i] == 'and' || words[i] == 'of' || words[i] == 'an' ||words[i] == 'a'||words[i] == 'in' 
				titlea << words[i] #don't capitalize these little words
			else
				titlea << words[i].capitalize #capitalize everything else
			end
		end
		@title = titlea.join(' ')
=end

		#Improved:
		@title = phrase.split.map do |word|
			if %w(the and of an a in).include?(word)
				word
			else
				word.capitalize
			end
		end
		@title.first.capitalize!
		@title = @title.join(' ')
	end
	#Lessons: See equivalent code in "simon_says.rb"
	#The only difference in this example is that @title has to be reassigned.

	def title
		@title
	end
end