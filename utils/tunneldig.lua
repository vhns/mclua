require("utils.dodig")
require("utils.moves")
require("utils.newforward")

function tunneldig(height, length)
    local moves = moves(length)

    for j = 1, moves do
        print("Iteration: ", j)
        if j > 1 then
            newforward(2)
        end
        for i = 1, height - 1 do
            dodig(j,moves,length)
        end
    end
end

