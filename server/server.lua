--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


-- VARIBLES
local Prefix = Function.Prefix
local resourceName = Function.ResourceName
local version = Function.Version


-- Run Checks
Citizen.CreateThread(function()

    checkName()
    checkVersion()

end)


RegisterCommand("respawn", function(source, args, rawCommand) 
    if isPlayerDead == true then
        TriggerClientEvent('AJ:Respawn')
        TriggerClientEvent('AJ:LOG', '/respawn')
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Great News, Your already alive!!"}})
    end         
end, false)


RegisterCommand("revive", function(source, args, rawCommand) 
    if isPlayerDead == true then
        TriggerClientEvent('AJ:Revive')
        TriggerClientEvent('AJ:LOG', '/revive')
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Great News, Your already alive!!"}})
    end
end, false)


RegisterCommand("adrespawn", function(source, args, rawCommand)
    if isPlayerDead == true then
        TriggerClientEvent('AJ:Respawn')
        TriggerClientEvent('AJ:LOG', '/adrespawn')
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Player is already alive!!"}})
    end
end, false)


RegisterCommand("adrevive", function(source, args, rawCommand)
    if isPlayerDead == true then
        TriggerClientEvent('AJ:Revive')
        TriggerClientEvent('AJ:LOG', '/adrevive')
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Player is already alive!!"}})
    end
end, false)

if Debug.Enabled then
    RegisterCommand("die", function(source, args, rawCommand)
        isPlayerDead == true
    end, false)
end


-- Credits --
-- Don't be weird.. Leave my Credits!!
print(Prefix.." "..resourceName.." by ImAidanJ\nCurrent Version: "..version)
print(Prefix.." Discord: https://discord.gg/cGdUjQQnNT")