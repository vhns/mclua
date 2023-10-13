require("utils.newforward")
require("utils.turtle180")

function newback(x)
	if xdelta == nil then
			turtle180()
		else
		if xdelta == true then
			turtle180()
		end
	end
	newforward(x)
	if xdelta == nil then
			turtle180()
	end
end
