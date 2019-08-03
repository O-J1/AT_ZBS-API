-- Place this in your \ZeroBraneStudio\packages folder

local id = ID("showatreference.showatreferencemenu")
local ident = "([a-zA-Z_][a-zA-Z_0-9%.]*)"
local func = {
['touchDown'] = True, 
['touchMove'] = True, 
['touchUp'] = True, 
['keyDown'] = True, 
['keyUp'] = True, 
['getColor'] = True, 
['getColors'] = True, 
['findColor'] = True, 
['findColors'] = True, 
['findImage'] = True, 
['screenshot'] = True, 
['appRun'] = True, 
['appKill'] = True, 
['appState'] = True, 
['rootDir'] = True, 
['currentPath'] = True, 
['usleep'] = True, 
['log'] = True, 
['alert'] = True, 
['toast'] = True, 
['vibrate'] = True, 
['playAudio'] = True, 
['stopAudio'] = True, 
['getOrientation'] = True, 
['getScreenResolution'] = True, 
['getSN'] = True, 
['getVersion'] = True, 
['frontMostAppId'] = True, 
['frontMostAppOrientation'] = True, 
['intToRgb'] = True, 
['rgbToInt'] = True, 
['copyText'] = True, 
['clipText'] = True, 
['inputText'] = True, 
['dialog'] = True, 
['clearDialogValues'] = True, 
['openURL'] = True, 
['isLicensed'] = True, 
['setAutoLaunch'] = True, 
['listAutoLaunch'] = True, 
['stop'] = True, 
['ocr'] = 'ocrregion-languages-threshold-whitelist-blacklist-timeout-tessdataparentdir-debug'}

local link = {
['touchDown'] = 'touchdownid-x-y', 
['touchMove'] = 'touchmoveid-x-y', 
['touchUp'] = 'touchupid-x-y', 
['keyDown'] = 'keydownkeytype', 
['keyUp'] = 'keyupkeytype', 
['getColor'] = 'getColors', 
['getColors'] = 'getcolorslocations', 
['findColor'] = 'findcolorcolor-count-region-debug-righttoleft-bottomtotop', 
['findColors'] = 'findcolorscolors-count-region-debug-righttoleft-bottomtotop', 
['findImage'] = 'findimagetargetimagepath-count-threshold-region-debug-method', 
['screenshot'] = 'screenshotfilepath-region', 
['appRun'] = 'apprunappidentifier', 
['appKill'] = 'appkillappidentifier', 
['appState'] = 'appstateappidentifier', 
['rootDir'] = 'rootdir', 
['currentPath'] = 'currentpath', 
['usleep'] = 'usleepmicroseconds', 
['log'] = 'logcontent', 
['alert'] = 'alertmessage', 
['toast'] = 'toastmessage-delay', 
['vibrate'] = 'vibrate', 
['playAudio'] = 'playaudioaudiofile-times', 
['stopAudio'] = 'stopaudio', 
['getOrientation'] = 'getorientation', 
['getScreenResolution'] = 'getscreenresolution', 
['getSN'] = 'getsn', 
['getVersion'] = 'getversion', 
['frontMostAppId'] = 'frontmostappid', 
['frontMostAppOrientation'] = 'frontmostapporientation', 
['intToRgb'] = 'inttorgbintcolor', 
['rgbToInt'] = 'rgbtointr-g-b', 
['copyText'] = 'copytexttext', 
['clipText'] = 'cliptext', 
['inputText'] = 'inputtexttext', 
['dialog'] = 'dialogcontrols-orientations', 
['clearDialogValues'] = 'cleardialogvaluesscript', 
['openURL'] = 'openurlurlstring', 
['isLicensed'] = 'islicensed', 
['setAutoLaunch'] = 'setautolaunchscriptpath-on', 
['listAutoLaunch'] = 'listautolaunch', 
['stop'] = 'stop', 
['ocr'] = 'ocrregion-languages-threshold-whitelist-blacklist-timeout-tessdataparentdir-debug'}

return {
  name = "Show AutoTouch reference",
  description = "Adds 'show AutoTouch reference' option to the editor menu.",
  author = "Xamanthas",
  version = 0.2,

  onMenuEditor = function(self, menu, editor, event)
    local point = editor:ScreenToClient(event:GetPosition())
    local pos = editor:PositionFromPointClose(point.x, point.y)
    if not pos then return end

    local line = editor:LineFromPosition(pos)
    local linetx = editor:GetLine(line)
    local localpos = pos-editor:PositionFromLine(line)
    local selected = editor:GetSelectionStart() ~= editor:GetSelectionEnd()
    and pos >= editor:GetSelectionStart() and pos <= editor:GetSelectionEnd()

    local start = linetx:sub(1,localpos):find(ident.."$")
    local right = linetx:sub(localpos+1,#linetx):match("^([a-zA-Z_0-9%.%:]*)%s*['\"{%(]?")
    local ref = selected
    and editor:GetTextRange(editor:GetSelectionStart(), editor:GetSelectionEnd())
    or (start and linetx:sub(start,localpos)..right or nil)
          
    --[[if #ref ~= 0 then
      if assert(func[ref], "No match found") then
        menu:Append(id, ("Show Reference: %s"):format(ref))
        menu:Connect(id, wx.wxEVT_COMMAND_MENU_SELECTED,
        ref = string.format(ref .. link[ref])
        ref = ref:lower(ref)
        function() wx.wxLaunchDefaultBrowser('https://autotouch.net/server/doc/en.html#'..ref, 0) end)
      end
    end]]
    if ref and func[ref] then
      menu:Append(id, ("Show documentation: %s"):format(ref))
      ref = string.format(ref .. link[ref])
      ref = ref:lower(ref)
      menu:Connect(id, wx.wxEVT_COMMAND_MENU_SELECTED,
      function() wx.wxLaunchDefaultBrowser('https://docs.autotouch.net/#'..ref, 0) end)
    end
  end
}
