on run {input, parameters}
	set targetApp to "Special Text"
	
	if application targetApp is running then
		tell application targetApp
			quit
			activate
			
		end tell
	else
		tell application targetApp to activate
	end if
	

	return input
end run