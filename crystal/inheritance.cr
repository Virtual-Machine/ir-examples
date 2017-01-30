def puts(x : Int32) : Int32
  x
end

class Test
  def print_num
    puts 1
  end
end

class Test2 < Test
  def self.print_num
    puts 2
  end
end

test = Test.new
test2 = Test2.new

test.print_num
test2.print_num
Test2.print_num
