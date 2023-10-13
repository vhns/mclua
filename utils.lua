function resetslot()
	turtle.select(1)
end

--[[ This function checks the current fuel level and,
     if the turtle isn't able to refuel, stops all functions
     and starts a timer set to 1 hour as it waits for more fuel.
     --]]
function refuel()
	if turtle.getFuelLevel() == 0 then
		local _ = 0
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
