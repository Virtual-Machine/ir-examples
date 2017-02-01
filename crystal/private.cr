class TestClass
  def initialize(@name : String)
    print 4
  end

  private def print(num : Int32) : Int32
    2 + 2 * 4 + num
  end
end

test = TestClass.new "Demo"
