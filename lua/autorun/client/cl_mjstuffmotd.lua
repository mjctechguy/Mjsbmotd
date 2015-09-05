--[[
Mj's Stuff - MOTD
Clientside File
]]

//Fonts
surface.CreateFont("MjsbmotdFont_TopTitleBar", {
  font = "Arial",
  size = 35,
  weight = 500
})

surface.CreateFont("MjsbmotdFont_Buttons", {
  font = "Arial",
  size = 25,
  weight = 100
})


MjsBMotd_Panel = {}
MjsBMotd = {}
function MjsBMotd_Panel:Init()
  self:SetSize(ScrW() / 1.1, ScrH() - 250)
  self:Center()
  local ButtonPanel = vgui.Create("DScrollPanel", self)
  ButtonPanel:Dock(LEFT)
  ButtonPanel:DockMargin(0, 50, 0, 0)
  ButtonPanel:SetSize(255, self:GetTall() - 50)
  self.ButtonPanel = ButtonPanel
  self.ButtonPanel.W, self.ButtonPanel.H = w, h
  local CloseButton = vgui.Create("DButton", self)
  CloseButton:SetPos(self:GetWide() - 45, 5)
  CloseButton:SetSize(40, 40)
  CloseButton:SetText("X")
  CloseButton:SetTextColor(mjsbmotdcolors.Basebackground)
  CloseButton:SetFont("MjsbmotdFont_Buttons")

  CloseButton.DoClick = function()
    MjsBMotd_OpenClose()
  end

  self.CloseButton = CloseButton
  self.CloseButton.W, self.CloseButton.H = w, h

  function SortMjsBMOTDButtons(a, b)
    return (a.pos < b.pos)
  end

  table.sort(mjcbmotdbuttons, SortMjsBMOTDButtons)

  for _, button in pairs(mjcbmotdbuttons) do
    local TheButtons = vgui.Create("DButton", self.ButtonPanel)
    TheButtons:Dock(TOP)
    TheButtons:DockMargin(10, 10, 10, 10)
    TheButtons:SetSize(250, 50)
    TheButtons:SetText(button.name)
    TheButtons:SetTextColor(mjsbmotdcolors.Basebackground)
    TheButtons:SetFont("MjsbmotdFont_Buttons")

    TheButtons.DoClick = function()
      if button.func then
        button.func()
      elseif button.webpage then
        self.Website:OpenURL(button.webpage)
      elseif button.webhtml then
        self.Website:SetHTML(button.webhtml)
      end
    end

    self.TheButtons = TheButtons
    self.TheButtons.W, self.TheButtons.H = w, h

    self.TheButtons.Paint = function()
      draw.RoundedBox(0, 0, 0, self.TheButtons:GetWide(), self.TheButtons:GetWide(), button.buttoncolor)
    end
  end

  local Website = vgui.Create("DHTML", self)
  Website:Dock(FILL)
  Website:DockMargin(0, 50, 0, 0)

  if mjsbmotdcfg.UseDefaultURL then
    Website:OpenURL(mjsbmotdcfg.DefaultURL)
  elseif mjsbmotdcfg.UseDefaultHTML then
    Website:SetHTML(mjsbmotdcfg.DefaultHTML)
  end

  self.Website = Website
  self.Website.W, self.Website.H = w, h
end

function MjsBMotd_Panel:Paint(w, h)
  draw.RoundedBox(0, 0, 0, w, h, mjsbmotdcolors.Basebackground)
  draw.RoundedBox(0, 0, 0, w, 50, mjsbmotdcolors.TopHeaderColor)
  draw.DrawText(mjsbmotdcfg.ServerTopTitle, "MjsbmotdFont_TopTitleBar", 10, 7, Color(255, 255, 255))

  self.ButtonPanel.Paint = function()
    draw.RoundedBox(0, 0, 0, self.ButtonPanel:GetWide(), self.ButtonPanel:GetTall(), mjsbmotdcolors.ButtonPanelBackground)
  end

  self.CloseButton.Paint = function()
    draw.RoundedBox(0, 0, 0, self.CloseButton:GetWide(), self.CloseButton:GetTall(), mjsbmotdcolors.CloseButton)
  end

  local sbar = self.ButtonPanel:GetVBar()

  function sbar:Paint(w, h)
    return true
  end

  function sbar.btnUp:Paint(w, h)
    return true
  end

  function sbar.btnDown:Paint(w, h)
    return true
  end

  function sbar.btnGrip:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, mjsbmotdcolors.ScrollBarColor)
  end
end

vgui.Register("MjsBMotd_MainPanel", MjsBMotd_Panel, "Panel")

function MjsBMotd_OpenClose()
  if IsValid(MjsBMotd) then
    MjsBMotd:Remove()
    gui.EnableScreenClicker(false)
  else
    MjsBMotd = vgui.Create("MjsBMotd_MainPanel")
    gui.EnableScreenClicker(true)
  end
end

net.Receive("MjsBMotd_StartMOTD", MjsBMotd_OpenClose)

if mjsbmotdcfg.UseConsoleCommandToOpenMOTD then
  concommand.Add(mjsbmotdcfg.ConsoleCommandToOpenMOTD, MjsBMotd_OpenClose)
end
