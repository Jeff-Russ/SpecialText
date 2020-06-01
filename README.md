## Special Text 

Special Text is a macOS application to quickly insert special characters or snippets of text into your favorite word processor, text editor or code editor. More accurately it's an Automator service together with an Automator app and a configuration file. 

#### Instruction for Installation

Launch the Automator app and create a service (aka "quick action") that does nothing but run the applescript code found in `Special Text (service).applescript` which you should cut and paste into Automator. Save this service with the name `Special Text`, although the name does not matter and will not be referred in any way other than while setting up a keyboard shortcut to run the service. This service will provide a way to launch the actual app with a keyboard shortcut which you can set up in macOS system preference->Keyboard->Shortcuts->Services then locate the name of the service and add a keyboard short cut such as `cmd-opt 3`

Ceate an Automator application and paste the code from `Special Text.app.applescript`. Create a folder called `Special Text/` somewhere such as in`/Applications/`or wherever your location is for Automator apps such as in your iCloud folder`/Automator/`. Save your application in this folder. 

Also place `optionsList.scpt` together with the application in this folder. This file can be edited by you to set up the keys and what they will insert in your document being edited in another application. This file must contain a function (called a "handler" in applescript by Apple) that returns list of lists where each sublist has three or four elements. Here is the sample definition:

```applescript
on getOptionsList()
	return {¬
		{"f", "(opt a) inserts:", "\dfrac{}{}"}, ¬
		{"pm", "(opt b) inserts:", "±"}, ¬
		{"R", "(opt c) inserts:", "ℝ", false}, ¬
		{"ra", "(opt d) inserts:", "→"} ¬
			}
end getOptionsList
```

This would create the menu:

```
f	   (opt a) inserts:  	\dfrac{}{}
pm	 (opt b) inserts:	  ±
ra	 (opt d) inserts:  	→
```

Since we have a third element `false` for the third sublist is is not shown but `"ℝ"`is still available to be inserted if `"R"` it typed. This is helpful to prevent the list from becomming clutted with easy-to-remember key shortcuts. 

#### How to use

Using Special Text is simple. When in your word processsor, text editor or code editor, type the keyboard shortcut for the service, which launches the app and presents you with the menu and text entry field. Type your select and hit enter. The menu goes away and text is inserted into your document. To bring up the menu again to insert something else or quit Special Text, type the keyboard shortcut again. 




