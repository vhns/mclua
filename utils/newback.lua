require "utils.newforward"
require "utils.turtle180"

function newback(x)
	turtle180()
	newforward(x)
	turtle180()
end
