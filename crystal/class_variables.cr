class Example
  @@counter = 0

  def initialize(@name : String)
    @@counter += 1
  end

  def self.count
    @@counter
  end
end

a = Example.new "First"
b = Example.new "Second"

Example.count
