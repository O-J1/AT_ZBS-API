# AT_ZBS-API
A ZeroBrane API and syntax highlighting, focused on devloping for AutoTouch.

**API for autocompletion and tooltips**
Place the halion.lua file to this folder: ZeroBraneStudio/api/lua
To register the api open your user settings (user.lua) and add line: 

api = {'at'}

Save settings and restart ZeroBraneStudio


**AT keywords highlighting**
Place the ATKeywords.lua file to this folder: \ZeroBraneStudio\packages
Place the user.lua file to this folder \ZeroBraneStudio\cfg **or**  add the values in manually to your user file which you can do by clicking Edit>Preferences>Settings:User in ZeroBraneStudio
Restart ZeroBraneStudio
You can change the color and appearance of syntax highlighting in your user settings (user.lua)

Example:

styles['keywords4'] = {fg = {193, 85, 77}, b = true, u = true}
styles['keywords5'] = {fg = {66, 86, 180}, b = true, u = true}
styles['keywords6'] = {fg = {0, 102, 0}, b = true, u = true}

{fg = {R, G, B}, [*optional*] bold, underlined, italicised)
