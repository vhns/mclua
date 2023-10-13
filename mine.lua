require utils
function emptyinventory(x, y, z)
    resetpos(x, y, z)
	for i = 2, 16 do
		turtle.select(i)
		turtle.dropDown()
	end
	resetslot()
	if z then
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
end

function resetpos(x, y, z)
	newdown(y)
	newback(x)
	if z then
	    if not (z == 0) then
	        if z <= 0 then
	            turtle.turnRight()
	        else
	            turtle.turnLeft()
            end
            newforward(math.abs(z))
	        if z <= 0 then
	            turtle.turnLeft()
	        else
	            turtle.turnRight()
            end
        end
    end
end

function moves(length)
    if length % 2 == 0 then
        return length / 2
    else
        return (length + 1) / 2
    end
end

function dodigforward(length, moves, iteration)
    if iteration == moves then
        if iteration * 2 == length then
            return true
        else
            return false
        end
    else
        return true
    end
end

function digdir(iteration)
    if iteration % 2 == 0 then
        return true
    else
        return false
    end
end

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

function godown(length, height)
    local moves = moves(length)
    if not digdir(moves) then
        newdown(height)
    else
        newforward(1)
    end
end

function cubedig(height, length, width)
    for i = 1, width do
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
    end
end
