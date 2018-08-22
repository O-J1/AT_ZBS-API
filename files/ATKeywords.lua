-- Place this in your \ZeroBraneStudio\packages folder

local func = 'touchDown touchUp touchMove keyDown keyUp getColor getColors findColor findColors findImage screenshot appRun appKill appState rootDir usleep log alert vibrate playAudio stopAudio getOrientation getScreenResolution getSN getVersion intToRgb copyText clipText inputText dialog clearDialogValues setTarget toast'

local cmdutils = 'cat cd launchctl curl cycript echo mv plutil sbreload scp wget id '

local const = 'KEY_TYPE HOME_BUTTON KEY_TYPE VOLUME_DOWN_BUTTON KEY_TYPE VOLUME_DOWN_BUTTON KEY_TYPE VOLUME_DOWN_BUTTON CONTROLLER_TYPE LABEL CONTROLLER_TYPE INPUT CONTROLLER_TYPE PICKER CONTROLLER_TYPE SWITCH ORIENTATION_TYPE UNKNOWN ORIENTATION_TYPE PORTRAIT ORIENTATION_TYPE PORTRAIT_UPSIDE_DOWN ORIENTATION_TYPE LANDSCAPE_LEFT ORIENTATION_TYPE LANDSCAPE_RIGHT'

local const2 = 'KEY_TYPE.HOME_BUTTON KEY_TYPE.VOLUME_DOWN_BUTTON KEY_TYPE.VOLUME_DOWN_BUTTON KEY_TYPE.VOLUME_DOWN_BUTTON CONTROLLER_TYPE.LABEL CONTROLLER_TYPE.INPUT CONTROLLER_TYPE.PICKER CONTROLLER_TYPE.SWITCH ORIENTATION_TYPE.UNKNOWN ORIENTATION_TYPE.PORTRAIT ORIENTATION_TYPE.PORTRAIT_UPSIDE_DOWN ORIENTATION_TYPE.LANDSCAPE_LEFT ORIENTATION_TYPE.LANDSCAPE_RIGHT'

return {
    name = "AutoTouch Keywords ",
    description = "Keywords for syntax highlighting",
    author = "Xamanthas",
    version = 0.1,
  
    onRegister = function(self) 
        local luaspecs =  ide.specs.lua
        local num = #luaspecs.keywords
        luaspecs.keywords[num + 0] = func
        luaspecs.keywords[num + 1] = const
        luaspecs.keywords[num + 2] = const2
        luaspecs.keywords[num + 3] = cmdutils
        ide:Print("To change the appearance of AutoTouch functions target the following in your user settings:")
        ide:Print("Function:")
        ide:Print("  styles['keywords"..(num + 0).."']")
        ide:Print("Constants:")
        ide:Print("  styles['keywords"..(num + 1).."']")
        ide:Print("Constants2:")
        ide:Print("  styles['keywords"..(num + 2).."']")
        ide:Print("cmd-utils:")
        ide:Print("  styles['keywords"..(num + 3).."']")
        ide:Print("Example: \n  styles['keywords5'] = {fg = {240, 0, 0}, b = true, u = true}")
    end
  }
