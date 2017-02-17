macro method_missing(call)
	print {{call.name.id.stringify}}, " called with: "
  {% for name in call.args %}
    print {{name.id}}, " "
  {% end %}
end

bar 'a', 'b'
