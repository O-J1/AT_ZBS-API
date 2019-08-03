--Drop this into your \ZeroBraneStudio\packages folder

local id = ID("athelpmenu.athelpmenu")
local url = "https://docs.autotouch.net/"
return {
  name = "AutoTouch Documentation",
  description = "Adds AutoTouch help option to the menu.",
  author = "Xamanthas",
  version = 0.2,

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
