class Timer
	#My solution
=begin
	attr_writer :seconds

	def initialize()
		@seconds = 0
	end

	def seconds()
		@seconds
	end
=end
	#Improved:
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end
	#Lessons:
	#The seconds function ("getter") is just the same as attr_reader :seconds.
	#Since I already defined attr_writer at the top, we can consolidate to attr_accessor :seconds.
	#Also, there's no need to add parentheses if no parameters are given


	def time_string
		#My Solution
		#hours = @seconds/60/60
		#minutes = (@seconds - (hours*60*60))/60
		#seconds = @seconds - (hours*60*60) - (minutes*60)

		#Improved:
		hours = @seconds/3600
		minutes = @seconds%3600/60
		seconds = @seconds%3600%60
		@time_string = "#{padded(hours)}:#{padded(minutes)}:#{padded(seconds)}"

		#Lessons: This is a more concise version.  When possible, combine terms.
		#hours is converted by dividing by the number of seconds in an hour
		#minutes is found by removing the hours then diving by conversion to minutes
		#seconds is found by removing the hours then removing the minutes
	end

	def padded(num)
		num.to_s.length == 2? num.to_s : '0' << num.to_s
	end
end