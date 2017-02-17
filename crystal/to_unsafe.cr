lib C
  fun exit(status : Int32) : NoReturn
end

class IntWrapper
  def initialize(@value : Int32)
  end

  def to_unsafe
    @value
  end
end

wrapper = IntWrapper.new(1)
C.exit(wrapper)
