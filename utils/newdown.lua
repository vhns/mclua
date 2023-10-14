require("utils.checkinventory")
require("utils.emptyinventory")
require("utils.refuel")

function newdown(y)
	for i = 0, y - 1 do
		refuel()
	    if docheckinventory then
		    if checkinventory() then
			    docheckinventory = false
			    xdelta_stop = true
			    emptyinventory(xpos, ypos, zpos)
			    xdelta_stop = nil
			    docheckinventory = true
		    end
            end
		while not (turtle.down()) do
		    turtle.digDown()
		end
		if not (ypos == nil) then
			ypos = ypos - 1
		end
	end
end
