-- Place this in your \ZeroBraneStudio\packages folder

local id = ID("showatreference.showatreferencemenu")
local ident = "([a-zA-Z_][a-zA-Z_0-9%.]*)"
local func = {['touchDown'] = true, ['touchUp'] = true, ['touchMove'] = true, ['keyDown'] = true, ['keyUp'] = true, ['getColor'] = true, ['getColors'] = true, ['findColor'] = true, ['findColors'] = true, ['findImage'] = true, [''] = true, ['screenshot'] = true, ['appRun'] = true, ['appKill'] = true, ['appState'] = true, ['rootDir'] = true, ['usleep'] = true, ['log'] = true, ['alert'] = true, ['vibrate'] = true, ['playAudio'] = true, ['stopAudio'] = true, ['getOrientation'] = true, ['getScreenResolution'] = true, ['getSN'] = true, ['getVersion'] = true, ['intToRgb'] = true, ['copyText'] = true, ['clipText'] = true, ['inputText'] = true, ['dialog'] = true, ['clearDialogValues'] = true, ['setTarget'] = true, ['toast'] = true,}

local link = {['touchDown'] = 'id-x-y', ['touchUp'] = 'id-x-y', ['touchMove'] = 'id-x-y', ['keyDown'] = 'keytype', ['keyUp'] = 'keytype', ['getColor'] = 'x-y', ['getColors'] = 'locations', ['findColor'] = 'color-count-region', ['findColors'] = 'colors-count-region', ['findImage'] = 'imagepath-count-fuzzy-ignorecolors-region', ['screenshot'] = 'filepath-region', ['appRun'] = 'appidentifier', ['appKill'] = 'appidentifier', ['appState'] = 'appidentifier', ['rootDir'] = "", ['usleep'] = 'microseconds',  ['log'] = 'content', ['alert'] = 'message', ['vibrate'] = "", ['playAudio'] = 'audiofile-times', ['stopAudio'] = "", ['getOrientation'] = "", ['getScreenResolution'] = "", ['getSN'] = "", ['getVersion'] = "", ['intToRgb'] = 'intcolor', ['copyText'] = 'r-g-b', ['clipText'] = '', ['inputText'] = "text", ['dialog'] = 'controls-enableremember', ['clearDialogValues'] = 'script', ['setTarget'] = "", ['toast'] = "",}

return {
  name = "Show AutoTouch reference",
  description = "Adds 'show AutoTouch reference' option to the editor menu.",
  author = "Xamanthas",
  version = 0.1,
  dependencies = "AutoTouch =>3.5, cURL, Erica Utilities, wget, coreutils, UIKit Tools, OpenSSH",

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
      function() wx.wxLaunchDefaultBrowser('https://autotouch.net/server/doc/en.html#'..ref, 0) end)
    end
  end
}
