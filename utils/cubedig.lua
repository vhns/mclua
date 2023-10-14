require("utils.digdir")
require("utils.flipbool.lua")
require("utils.godown")
require("utils.tunneldig")

function cubedig(height, length, width)
    xdelta = true
    xpos = 0
    ypos = 0
    zpos = 0
    docheckinventory = true
    for i = 1, width do
	if not (i == 1) then
		xdelta = flipbool(xdelta)
	end
        tunneldig(height, length)
        godown(length, height)
        if digdir(i) then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end
        if not (i == width) then
            newforward(1)
        end
        if digdir(i) then
            turtle.turnLeft()
        else
            turtle.turnRight()
        end
	zpos = zpos + 1
    end
end
