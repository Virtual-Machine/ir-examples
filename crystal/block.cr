def puts(word)
	word
end

class Example
	def twice
	  v1 = yield 1
	  puts v1

	  v2 = yield 2
	  puts v2
	end
end

example = Example.new

example.twice do |i|
  i + 1
end