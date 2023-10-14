require("utils.newback")
require("utils.newdown")
require("utils.newforward")

function resetpos(x, y, z)
	newdown(y)
	newback(x)
	if not (z == nil) then
	    if not (z == 0) then
	        if z <= 0 then
	            turtle.turnLeft()
	        else
	            turtle.turnRight()
            end
            newforward(math.abs(z))
	        if z <= 0 then
	            turtle.turnRight()
	        else
	            turtle.turnLeft()
            end
        end
    end
end
