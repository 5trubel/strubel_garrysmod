hook.Add( "OnPlayerChat", "HelloCommand", function( ply, strText, bTeam, bDead ) 
    if ( ply != LocalPlayer() ) then return end

	strText = string.lower( strText ) -- make the string lower case

	if ( strText == "/hello" ) then -- if the player typed /hello then
		print( "Hello world!" ) -- print Hello world to the console
		return true -- this suppresses the message from being shown
	end
end )