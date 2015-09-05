--[[
Mj's Stuff - MOTD
Config File
]]

//Main Config for options and stuff
mjsbmotdcfg = {}
mjsbmotdcfg.LoadOnSpawn = true
mjsbmotdcfg.ServerTopTitle = "Sir Mjctechguy's Basic Stuff - MOTD"
mjsbmotdcfg.UseKeyToOpenMOTD = true
mjsbmotdcfg.KeyToOpenMOTD = "F4" // Only keys to use F1, F2, F3, F4

mjsbmotdcfg.UseDefaultURL = true
mjsbmotdcfg.DefaultURL = "http://www.google.co.uk"
mjsbmotdcfg.UseDefaultHTML = false
mjsbmotdcfg.DefaultHTML = "http://www.google.co.uk"

mjsbmotdcfg.UseConsoleCommandToOpenMOTD = true
mjsbmotdcfg.ConsoleCommandToOpenMOTD = "mjsbmotd"
mjsbmotdcfg.UseChatCommandToOpenMOTD = true
ChatCommandToOpenMOTD = {
  ["!motd"] = true,
  ["/motd"] = true,
  ["@motd"] = true,
}

//Colours for MOTD
mjsbmotdcolors = {
 Basebackground = Color(223, 231, 242),
 TopHeaderColor = Color(223, 170, 32),
 ButtonPanelBackground = Color(52, 79, 194),
 CloseButton = Color(199, 14, 14),
 ScrollBarColor = Color(199, 14, 14),
}

//Buttons
mjcbmotdbuttons = {
  {
    pos = 1,
    name = "WEBSITE URL HERE",
    webpage = "http://google.co.uk/",
    buttoncolor = Color(50, 68, 94),
  },
  {
    pos = 2,
    name = "HTML HERE",
    webhtml = "<p>Put HTML code here</p>",
    buttoncolor = Color(50, 68, 94),
  },
}
