def counter(num : Int32)
  x = 0
  y = num
  ->{ x += 1; y += 2; x + y}
end

proc = counter 0
proc.call #=> 3
proc.call #=> 6