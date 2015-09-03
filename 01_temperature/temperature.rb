def ftoc(f)
	#My original solution:
	#c = (f-32.0)/1.8
	#c = c.round

	#Improved:
	((f-32.0)/1.8).round
	#Lesson: no need to assign something
	#that will just be returned.

	#Also, use composition to run methods on
	#expressions
end

def ctof(c)
	#My original solution:
	#f = 1.8*c+32

	#Improved:
	1.8*c + 32
	#Lesson: no need to assign
	#something that will already be returned.
end