----------------------------------------global variables----------------------------------------

global otherAppName
global thisAppName
global optionsList

----------------------------------------Handler using Globals----------------------------------------

on run {input, parameters}
	set inc to load script (alias (POSIX file ((POSIX path of ((path to me as text) & "::")) & "optionsList.scpt")))
	set optionsList to (inc's getOptionsList())
	
	set thisAppName to "Special Text (resident)" --testing
	tell application "System Events"
		set otherAppName to name of first process whose frontmost is true
	end tell
	
	
	if (runMenu()) is not equal to false then
		repeat
			delay 10
		end repeat
	end if
	
end run


on runMenu()
	set theReply to (getTypedSelection("Quit", "Insert", "Insert", false))
	if theReply is equal to false then
		return false
	else
		pasteInApp(otherAppName, theReply)
		return true
	end if
end runMenu


on getTypedSelection(cancelBtn, okBtn, defaultBtn)
	--each element in optionsList takes the form {"type me", "optional string" / "get this"} 
	--which could be called key/info/value Lists. Each of these element will be a line in a 
	--prompt of options for the user. If you don't want the "optional string" set it to ""
	--there is no icon, buttons are labeled but 2nd/3rd args and 4th arg should match one.
	--the return is false when cancel button (escape) is pressed
	--the return is the "get this" if "type me" is typed exactly, followed by ok button (return)
	
	set promptMsg to (listsToLinesFiltered(optionsList, tab))
	
	repeat
		set theReply to display dialog promptMsg default answer "" buttons {cancelBtn, okBtn} default button defaultBtn
		if (button returned of theReply) is equal to cancelBtn then return false
		--else
		set theReply to (text returned of theReply)
		
		repeat with idx from 1 to length of optionsList
			set curItem to item idx of optionsList
			if theReply is equal to (item 1 of curItem) then return (item 3 of curItem)
		end repeat
		--else
		display alert "Special Text" message "\"" & theReply & "\"" & " command not found."
	end repeat
end getTypedSelection



----------------------------------------Variable Mutators----------------------------------------

on listsToLinesFiltered(listOfLists, delimitWith)
	set saveTID to text item delimiters
	set text item delimiters to delimitWith
	set retStr to ""
	repeat with idx from 1 to length of listOfLists
		set subList to item idx of listOfLists
		if end of subList is not equal to false then
			set retStr to retStr & (subList as text) & "
" -- yes this is correct, it's a newline
		end if
	end repeat
	set text item delimiters to saveTID
	return retStr
end listsToLinesFiltered



----------------------------------------UI and User Actions----------------------------------------


on pasteInApp(appName, content)
	tell application "System Events" to tell process appName to set frontmost to true
	
	tell application "System Events"
		tell process appName
			set the clipboard to content
			keystroke "v" using {command down}
		end tell
	end tell
	
end pasteInApp






