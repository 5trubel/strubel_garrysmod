-- If a Player types something in the Chat Log play a Sound to everyone
hook.Add("OnPlayerChat", "PlaySound", function(ply,txt)
	if string.find(txt, "dumm") then
		ply:EmitSound("sound/tafelsounds/dumm.wav")
		-- Write to Console
		print(ply:Nick() .. " played the sound 'dumm'.")
	end
end)