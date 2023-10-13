require("utils.checkinventory")
require("utils.refuel")

function newforward(x)
	for i = 0, x - 1 do
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
	    while not (turtle.forward()) do
	        turtle.dig()
	    end
	    if not (xdelta == nil) and not (xdelta_stop == true) then
	        print("xdelta = ", xdelta)
		    if xdelta == true then
			    xpos = xpos + 1
			    print(xpos)
		    else
			    xpos = xpos - 1
			    print(xpos)
		    end
	    end
	end
end

