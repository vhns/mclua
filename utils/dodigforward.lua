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
