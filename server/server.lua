--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


-- ImAidanJ Information
local Prefix = "^4[AJ:DeathSystem]^0"
local resourceName = "AJDeathSystem"
local Version = "1.0.0"


 -- Check to see if script is named properly
Citizen.CreateThread(function()
    local currentResourceName = GetCurrentResourceName()

    if currentResourceName ~= resourceName then
        print("^1[ERROR]^7 Incorrect resource name detected. Shutting down the resource...")
        print("^1[ERROR]^7 Resource must be named 'AJDeathSystem' to work.")
        StopResource(currentResourceName)
        return
    end
end)


RegisterCommand("respawn", function(source, args, rawCommand) 
    if isPlayerDead == true then
        -- respawn logic here
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Great News, Your already alive!!"}})
    end         
end, false)


RegisterCommand("revive", function(source, args, rawCommand) 
    if isPlayerDead == true then
        -- revive logic here
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Great News, Your already alive!!"}})
    end
end, false)


RegisterCommand("adrespawn", function(source, args, rawCommand)
    if isPlayerDead == true then
        -- admin respawn logic here
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Player is already alive!!"}})
    end
end, false)


RegisterCommand("adrevive", function(source, args, rawCommand)
    if isPlayerDead == true then
        -- admin revive logic here
    end
    else if isPlayerDead == false then
        TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Prefix.." Player is already alive!!"}})
    end
end, false)


-- Credits --
-- Don't be weird.. Leave my Credits!!
print(Prefix.." Death System by ImAidanJ")
print(Prefix.." Discord: discord.gg/cGdUjQQnNT")
print(Prefix.." Version: "..Version)