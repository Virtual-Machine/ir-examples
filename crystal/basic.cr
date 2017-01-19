def puts(item)
  item
end

def add_2(num : Int32) : Int32
  num + 2
end

four = 4

if four > 2
  six = add_2 four
end

puts six
