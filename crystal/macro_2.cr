def puts(value)
  value
end

{% if env("TEST") %}
  puts "We are in test mode"
{% else %}
	puts "We are in normal mode"
{% end %}
