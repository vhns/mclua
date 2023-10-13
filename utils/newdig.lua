require("utils.checkinventory")

function newdig()
   if docheckinventory then
    if checkinventory() then
			    docheckinventory = false
			    xdelta_stop = true
			    emptyinventory(xpos, ypos, zpos)
			    xdelta_stop = nil
			    docheckinventory = true
    end
   end
   while turtle.detect() do
	turtle.dig()
   end
end
