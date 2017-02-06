def twice
  yield
  puts "Middle"
  yield
end

def puts(word : String) : String
	word
end

twice do
  puts "Hello!"
end