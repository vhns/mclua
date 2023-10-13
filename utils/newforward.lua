function newforward(x)
	for i = 0, x - 1 do
	    refuel()
	    while not (turtle.forward()) do
	        turtle.dig()
	    end
	    if not (xdelta == nil) then
		    if xdelta then
			    xpos = xpos + 1
		    else
			    xpos = xpos - 1
		    end
	    end
	end
end
