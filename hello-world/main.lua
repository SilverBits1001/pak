--[[
Hello World example pak for the TrimUI Brick running Next UI.

This file uses the high level helpers provided by Next UI. The
helpers exposed on the `nextui` global are available inside each
pak and match the behaviour that the stock launcher uses. The
implementation below intentionally keeps everything in a single
file so that it can be used as a minimal starting point.
]]

local nextui = require("nextui")

local lorem = [[
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur
malesuada commodo lorem, non maximus mauris ultricies id. Vestibulum
ac leo ac neque ultrices sollicitudin sed in lorem. Donec accumsan
malesuada fermentum. Maecenas hendrerit sapien id erat fringilla,
a sed nisl imperdiet. Pellentesque habitant morbi tristique senectus
et netus et malesuada fames ac turpis egestas.
]]

local menuItems = {
  { id = "option-1", label = "Option One" },
  { id = "option-2", label = "Option Two" },
  { id = "option-3", label = "Option Three" },
}

--- Push the detail screen for the selected option on top of the stack.
--- @param app NextApp
--- @param item table
local function pushDetailScreen(app, item)
  app:pushScreen(nextui.screens.Text {
    title = item.label,
    body = lorem,
    footer = "Press B to go back",
    onButton = function(button)
      if button == "b" then
        app:popScreen()
        return true
      end
      return false
    end,
  })
end

--- Entry point invoked by the Next UI runtime.
--- @param app NextApp
return function(app)
  app:onButton(function(button)
    if button == "b" and app:screenCount() == 1 then
      app:exit()
      return true
    end
    return false
  end)

  local menu = nextui.screens.List {
    title = "Hello World",
    subtitle = "Choose an option",
    items = menuItems,
    onAccept = function(index)
      pushDetailScreen(app, menuItems[index])
    end,
    onCancel = function()
      app:exit()
    end,
  }

  app:pushScreen(menu)
end
