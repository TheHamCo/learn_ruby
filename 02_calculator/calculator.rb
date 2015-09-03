def add(p1,p2)
	p1+p2
end

def subtract(p1,p2)
	p1-p2
end

def sum(array)
	#My original solution:
	#y = 0
	#array.each {|element| y += element}
	#return y

	#Improved:
	array.inject(0) {|sum,n| sum + n}

	#Lesson:
	#http://ruby-doc.org/core-2.2.3/Enumerable.html#method-i-inject
	#The inject method, is included in the Array class as a mixin.
	#(see http://www.sitepoint.com/guide-ruby-collections-iii-enumerable-enumerator/
	#It takes an initial number as a parameter.  In the code block, the first argument is 
	#an accumulator.  The second is each element in the array.  The method returns
	#The final accumulated value according to the operation specified in the code block.
	#In this sense, inject applies a binary operation (https://en.wikipedia.org/wiki/Binary_operation)
	#Alternative syntax allows passing a symbol with a method name.
	#if an initial value is not specified, then the initial value is the first value of the array.

	#0 must be passed as an initial value because passing 0 into the method has to return 0, not nil.
end

def multiply(p1,p2)
	p1*p2
end

def power(p1,p2)
	p1**p2
end

def factorial(n)
	#My original solution:
	#n==(0||1)? 1 : n*factorial(n-1)

	#Improved:
	#n<=1? 1 : n*factorial(n-1)

	#Lesson:
	#More general and easy to read.

	#Issue!
	#Will not respond to negative numbers,
	#which don't have factorials (divide by zero!)
	#The fix:  (added another test case to the spec also)
	#if n < 0
	#	nil
	#else
	#	n<=1? 1 : n*factorial(n-1)
	#end

	#An even more compact (albeit harder to read) version:
	n < 0 ? nil : (n<=1? 1 : n*factorial(n-1))
end