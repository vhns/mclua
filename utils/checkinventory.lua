require "utils.resetslot"

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
