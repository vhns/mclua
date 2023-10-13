function resetslot()
	turtle.select(1)
end

--[[ This function checks the current fuel level and,
     if the turtle isn't able to refuel, stops all functions
     and starts a timer set to 1 hour as it waits for more fuel.
     --]]
function refuel()
	if turtle.getFuelLevel() == 0 then
		_ = 0
		while not (turtle.refuel(1)) do
			_ = _ + 1
			if _ == 21601 then
				error("Spent an hour without fuel. Exiting the program")
			end
			print("We have no fuel!!! You have ", (21601 - _) * 10, "seconds to refuel before the program errors out.")
			sleep(10)
		end
	end
end

--[[ Checks if the inventory is full.
     Returns true on full.
     --]]
function checkinventory()
	for i = 2, 16 do
		turtle.select(i)
		if turtle.getItemCount() == 0 then
			resetslot()
			return false
		end
	end
	resetslot()
	return true
end

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

function newforward(x)
	for i = 0, x - 1 do
	    refuel()
	    while not (turtle.forward()) do
	        turtle.dig()
	    end
	end
end

function newup(y)
	for i = 1, y do
		refuel()
		while not (turtle.up()) do
			turtle.digUp()
		end
	end
end

function newdown(y)
	for i = 0, y - 1 do
		refuel()
		while not (turtle.down()) do
		    turtle.digDown()
		end
	end
end

function turtle180()
	for i = 0, 1 do
		turtle.turnLeft()
	end
end

function newback(x)
	turtle180()
	newforward(x)
	turtle180()
end

function newdig()
    while turtle.detect() do
        turtle.dig()
    end
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

--[[function stripmine(a,b)
	x = 0
	y = 0
	for i = 1, a do
		for j = 0, b - 1 do
			if (checkinventory()) then
				emptyinventory(x, y, z)
			end
			turtle.dig()
			y = y + 1
			if not (y == b) then
				newup(1)
			end
		end
		for j = 0, b - 1 do
			y = y - 1
			if not (y == 0) then
				newdown(1)
			end
		end
		--print("X: ", x)
		newforward(1)
		x = x + 1
end
	resetpos(x, y, z)
end

function tunnelmine()
	print("Type length")
	a = tonumber(read())

	print("Type height")
	b = tonumber(read())

	print("Type width")
    c = tonumber(read())

    z = 0
	x = 0
	y = 0

	for i = 1, c do
	    stripmine(a,b)
	    if not (i == c) then
	        The proper way to do this would also be having a temporary
	         variable for z, as to reset z while we are moving in the z
	         direction. Why? Because if the inventory fills up during this move,
	         we are going to resetpos() to the wrong place.
	        z = z + 1
            turtle.turnRight()
	        newforward(z)
	        turtle.turnLeft()
	    end
	end
end--]]

function reaptreeline(amount,spacing)
    for i = 1, amount do
        --newforward(spacing)
        if (turtle.detectDown() and turtle.detectUp()) then
            c = 0
            turtle.digDown()
		    while (turtle.detectUp()) do
			    newup(1)
			    c = c + 1
		    end
		    newdown(c)
		end
	    if not (turtle.detectDown()) then
	        turtle.select(2)
	        turtle.placeDown()
	        resetslot()
	    end
		newforward(spacing)
	end
end
function trees(amount, spacing, rows)
    --distance = amount * spacing
    if (rows == nil or rows == 1) then
        newforward(spacing + 1)
        reaptreeline(amount - 1, spacing + 1)
        turtle180()
        reaptreeline(amount, spacing + 1)
        turtle180()
    else
        newforward(spacing + 1)
        for i = 1, rows do
                reaptreeline(amount - 1, spacing + 1)
                if not (i == rows) then
                    if (i % 2 == 0) then
                        turtle.turnLeft()
                    else
                        turtle.turnRight()
                    end
                    reaptreeline(1, spacing + 3)
                    if (i % 2 == 0) then
                        turtle.turnLeft()
                    else
                        turtle.turnRight()
                    end
                end
                --reaptreeline(amount - 1, spacing + 1)
        end
        if not (rows % 2 == 0) then
                turtle180()
                reaptreeline(amount - 1, spacing + 3)
        end
        turtle.turnRight()
        reaptreeline(rows - 1, spacing + 3)
        turtle.turnLeft()
        newforward(spacing + 1)
    end
	for i = 3, 16 do
		turtle.select(i)
		turtle.dropDown()
	end
	resetslot()
	if not (rows == nil or rows == 1) then
	    turtle180()
	end
end
function handledam(length)
    for i = 1, length do
        newforward(1)
        if not (turtle.detectDown()) then
            while not (turtle.detectDown()) do
                turtle.select(2)
                turtle.placeDown()
                resetslot()
            end
        else
            turtle.digDown()
        end
    end
    newforward(1)
    turtle180()
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
