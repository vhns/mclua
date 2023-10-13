require "utils.refuel"

function newdown(y)
	for i = 0, y - 1 do
		refuel()
		while not (turtle.down()) do
		    turtle.digDown()
		end
	end
end
