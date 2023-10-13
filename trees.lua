require("utils.newdown")
require("utils.newforward")
require("utils.newup")
require("utils.turtle180")

function reaptreeline(amount,spacing)
    for i = 1, amount do
        --newforward(spacing)
        if (turtle.detectDown() and turtle.detectUp()) then
            local c = 0
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
