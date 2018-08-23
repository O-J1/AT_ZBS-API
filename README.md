# AT_ZBS-API
A ZeroBrane API and syntax highlighting, focused on devloping for AutoTouch.

### API for autocompletion and tooltips for functions

Place the at.lua file to this folder: ZeroBraneStudio/api/lua.  
To register the api, open your user settings (user.lua) and add line:  

    api = {'at'}

Save settings and restart ZeroBraneStudio


### AT keywords highlighting

Place the ATKeywords.lua file to this folder: \ZeroBraneStudio\packages  
Place the user.lua file to this folder \ZeroBraneStudio\cfg **or** add the values in manually to your user file which you can do by clicking Edit>Preferences>Settings:User in ZeroBraneStudio  
Restart ZeroBraneStudio  
You can change the color and appearance of syntax highlighting in your user settings (user.lua)  

### Function lookup

Lookup detailed function with direct in menu links to official documentation on https://autotouch.net/server/doc/en.html

#### Reccomended userfile changes:

	styles = loadfile('cfg/tomorrow.lua')('TomorrowNightEighties') -- theme matching AT keywords highlighting
	stylesoutshell = styles -- apply the same scheme to Output/Console windows
	styles.auxwindow = styles.text -- apply text colors to auxiliary windows
    styles.calltip = styles.text -- apply text colors to tooltips
    styles['keywords3'] = {fg = {204, 153, 204}, u = true, i = true}   
    styles['keywords4'] = {fg = {204, 205, 76}, u = true }  
    styles['keywords5'] = {fg = {204, 205, 76}, u = true }  
    styles['keywords6'] = {fg = {218, 86, 86}}  

{fg = {R, G, B}, [*optional*] bold, underlined, italicised)  
