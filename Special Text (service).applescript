on run {input, parameters}	
	set targetApp to "Special Text"
	
	--this service's key shortcut can be used to either launch the app
	--or to shift focus back to it.
	
	repeat until application targetApp is not running
		tell application targetApp
			quit
		end tell    
    	delay 0.3
    end repeat

	tell application targetApp to activate
	
	return input
end run