class Example
	@four : Int32 | Float64

	def initialize()
		@four = 4
		@nilable = 4
	end

	def four
		@four
	end
end


a = Example.new

if a.four.is_a?(Int32)
	a.four
else
	"Float"
end