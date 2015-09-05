--[[
Mj's Stuff - MOTD
Serverside File
]]
util.AddNetworkString("MjsBMotd_StartMOTD")

function MjsBMotd_StartOnSpawn(ply)
  if mjsbmotdcfg.LoadOnSpawn then
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)
  end
end

hook.Add("PlayerInitialSpawn", "MjsBMotd_StartOnSpawn", MjsBMotd_StartOnSpawn)

if mjsbmotdcfg.KeyToOpenMOTD == "F1" then
  hook.Add("ShowHelp", "OpenCMOTDKey", function(ply)
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)
  end)
elseif mjsbmotdcfg.KeyToOpenMOTD == "F2" then
  hook.Add("ShowTeam", "OpenCMOTDKey", function(ply)
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)
  end)
elseif mjsbmotdcfg.KeyToOpenMOTD == "F3" then
  hook.Add("ShowSpare1", "OpenCMOTDKey", function(ply)
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)
  end)
elseif mjsbmotdcfg.KeyToOpenMOTD == "F4" then
  hook.Add("ShowSpare2", "OpenCMOTDKey", function(ply)
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)
  end)
end

function MjsBMotd_ChatCommand(ply, text)
  if not IsValid(ply) then return end
  if not str then return end

  if ChatCommandToOpenMOTD[str:lower()] then
    net.Start("MjsBMotd_StartMOTD")
    net.Send(ply)

    return ""
  end
end
hook.Add("PlayerSay", "MjsBMotd_ChatCommand", MjsBMotd_ChatCommand)
