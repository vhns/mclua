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
