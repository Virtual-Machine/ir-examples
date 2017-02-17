def puts(value)
  value
end

macro define_method(name, content)
  def {{name.id}}
    {{content}}
  end
end

define_method :foo, 1 + 0
define_method "great", 2 + 0
define_method what, 3 + 0

puts foo
puts great
puts what
