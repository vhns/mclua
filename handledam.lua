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
