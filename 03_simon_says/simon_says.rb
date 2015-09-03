def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, n=2)

	#My Solution:
	#rep = []
	#n.times{rep << word}
	#rep = rep.join(' ')

	#Improved:
	([word] * n).join(' ')

	#Lesson:
	#Simpler, shorter way of solving this.
	#No need to specify a separate array.
end

def start_of_word(word,n)
	#My solution:
	#word[0..(n-1)]

	#Improved:
	word[0...n]

	#Lesson:
	#the ... in range is not inclusive.
	#it is equivalent to ..(n-1)
end

def first_word(phrase)#Can also be done phrase.split(' ').first, 
	#but this accounts for punctuation (not that the test cases ask for it...)

	#My solution:
	#phrase.scan(/\w+/).first

	#Improved:
	phrase.split(' ').first

	#Lesson:
	#All the test cases use spaces as delimiters (no punctuation or weird cases)
	#So this is simpler, easier to read, and more appropriate to past the tests.
end

def titleize(phrase)

	#My solution:
=begin
	title = [] #Initialize title array (final output)
	words = phrase.scan(/\w+/) #Scan through the words input, splitting each word into an element in the words array
	#I could implement above using .split(' ')
	words.each_index do |i|
		if i==0 #Always capitalize the first word, regardless of type
			title << words[0].capitalize
			next
		end
		#If the word is a "little word" according to the test cases
		#Need to find out why the "ORs" don't work as expected
		if words[i] == 'the' || words[i] == 'and' || words[i] == 'over' 
			title << words[i] #don't capitalize these little words
		else
			title << words[i].capitalize #capitalize everything else
		end
	end

	title = title.join(' ') #Rejoin the title array into a single string
=end


	#Improved:
	capped = phrase.split.map do |word|
		if %w(the over and).include?(word)
			word
		else
			word.capitalize
		end
	end
	capped.first.capitalize!
	capped.join(' ')

	#Lesson:
	#1. In my original solution, I split the array using scan and regex,
	#which is way more complicated than just using split.  All the
	#test casese use spaces, so .split suffices.
	# => 1.a. .split is the same as .split(' ')

	#2. I tried to account for capitalizing the first word in the code block.
	#That could be done at the end.  Once the whole capitalized array is assmebled,
	#Then a final touch can be added to ALWAYS capitalize the first element.
	#In other words, if something HAS to be done to a certain element, and the others
	#are conditional, then add the certain operation last.
	#In this example, it removes the need to iterate using array indices

	#3. Understand the map method (http://ruby-doc.org/core-1.9.3/Array.html#method-i-map)
	#It runs the block for every array element and RETURNS A NEW ARRAY according
	#to the VALUES RETURNED BY THE BLOCK.

	#4. Multiple comparison can be done using .include?
	#In my code, I tried to compare the word to a list of other words using booleans
	#Somehow, the syntax didn't work as expected, so I had to write a verbose version
	#Instead, create an array using %w and check if the word being compared is a subset
	#of that list (.include?).

	#5. the %letter syntax allows easier formatting of arrays with elements of the same type.
end