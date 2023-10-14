require("utils.digdir")
require("utils.dodigforward")
require("utils.newdig")
require("utils.newdown")
require("utils.newup")

function dodig(iteration, moves, length)
    if dodigforward(length, moves, iteration) then
        newdig()
    end
    if digdir(iteration) then
        newdown(1)
    else
        newup(1)
    end
end
