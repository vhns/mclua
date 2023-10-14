require("utils.newforward")
require("utils.newup")
require("utils.resetpos")
require("utils.resetslot")
require("utils.turtle180")

function emptyinventory(x, y, z)
	resetpos(x, y, z)
	for i = 2, 16 do
		turtle.select(i)
		turtle.dropDown()
	end
	resetslot()
	turtle180()
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
	newforward(x)
	newup(y)
	if not (xdelta == nil) then
		if xdelta == false then
			turtle180()
		end
	end
end
