class TestClass
  def initialize(@name : String)
  end

  def print : String
    "This is a TestClass"
  end
end

test = TestClass.new "Demo"
output = test.print
