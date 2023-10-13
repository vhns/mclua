require("utils.checkinventory")
require("utils.refuel")

function newup(y)
	for i = 1, y do
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
		while not (turtle.up()) do
			turtle.digUp()
		end
		if not (ypos == nil) then
			ypos = ypos + 1
		end
	end
end
