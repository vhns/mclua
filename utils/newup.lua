function newup(y)
	for i = 1, y do
		refuel()
		while not (turtle.up()) do
			turtle.digUp()
		end
	end
end
