--Drop this into your \ZeroBraneStudio\packages folder

local id = ID("athelpmenu.athelpmenu")
local url = "https://autotouch.net/server/doc/en.html"
return {
  name = "AutoTouch Documentation",
  description = "Adds AutoTouch help option to the menu.",
  author = "..",
  version = 0.1,
  dependencies = "AutoTouch =>3.5, cURL, Erica Utilities, wget, coreutils, UIKit Tools, OpenSSH",

  onRegister = function(self)
    local menu = ide:FindTopMenu("&Help")
    menu:Append(id, "AutoTouch Documentation")
    ide:GetMainFrame():Connect(id, wx.wxEVT_COMMAND_MENU_SELECTED,
      function(event) wx.wxLaunchDefaultBrowser(url, 0) end)
  end,

  onUnRegister = function(self)
    ide:RemoveMenuItem(id)
  end,
}
