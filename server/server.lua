-- TODO: Add a system so admins can use the commands to respawn and revive other.
-- > Most likey will us different commands so I can add the options to revive a user by there id.


Citizen.CreateThread(function()
    local resourceName = "AJDeathSystem"
    local currentResourceName = GetCurrentResourceName()

    if currentResourceName ~= resourceName then
        print("^1[ERROR]^7 Incorrect resource name detected. Shutting down the resource...")
        print("^1[ERROR]^7 Resource must be named 'AJDeathSystem' to work.")
        StopResource(currentResourceName)
        return
    end
end)

local respawnTimers = {}
local reviveTimers = {}

-- Below is the Respawn Logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000) -- Wait 10 seconds
        for source, timer in pairs(respawnTimers) do
            if timer > 0 then
                local remainingTime = timer - 10
                if remainingTime <= 0 then
                    if GetPlayerPed(source) ~= 0 then -- Check if player is still alive
                        TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You can now respawn using /respawn."}})
                    end
                    respawnTimers[source] = nil
                else
                    respawnTimers[source] = remainingTime
                    TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 Respawn available in " .. remainingTime .. " seconds."}})
                end
            end
        end
    end
end)

RegisterCommand("respawn", function(source, args, rawCommand) 
    if not Config.Respawn.EnableAcePerms or IsPlayerAceAllowed(source, Config.Respawn.AcePermString) then
        if not respawnTimers[source] then
            respawnTimers[source] = Config.Respawn.RespawnTime
            TriggerClientEvent('AJ:Respawn', source)
        else
            TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You are already waiting to respawn."}})
        end
    else
        TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You do not have permission to use this command."}})
    end
end, false)


-- Below is the Revive Logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000) -- Wait 10 seconds
        for source, timer in pairs(reviveTimers) do
            if timer > 0 then
                local remainingTime = timer - 10
                if remainingTime <= 0 then
                    if GetPlayerPed(source) == 0 then -- Check if player is dead
                        TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You can now revive using /revive."}})
                    end
                    reviveTimers[source] = nil
                else
                    reviveTimers[source] = remainingTime
                    TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 Revive available in " .. remainingTime .. " seconds."}})
                end
            end
        end
    end
end)

RegisterCommand("revive", function(source, args, rawCommand) 
    if not Config.Revive.EnableAcePerms or IsPlayerAceAllowed(source, Config.Revive.AcePermString) then
        if not reviveTimers[source] then
            reviveTimers[source] = Config.Revive.ReviveTime
            TriggerClientEvent('AJ:Revive', source)
        else
            TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You are already waiting to revive."}})
        end
    else
        TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You do not have permission to use this command."}})
    end
end, false)


-- Credits --
-- Don't be weird.. Leave my Credits!!

print("^4[AJ:DeathSystem]^0 Death System by ImAidanJ")
print("^4[AJ:DeathSystem]^0 Discord: https://discord.gg/cGdUjQQnNT")
print("^4[AJ:DeathSystem]^0 Version: 1.0.0")