require("utils.digdir")
require("utils.moves")
require("utils.newdown")
require("utils.newforward")

function godown(length, height)
    local moves = moves(length)
    if not digdir(moves) then
	if length % 2 == 0 then
		newforward(1)
	end
        newdown(height-1)
    end
end
