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
        else
            TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You are already waiting to respawn."}})
        end
    else
        TriggerClientEvent("chat:addMessage", source, {template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>', args = {"^4[AJ:DeathSystem]^0 You do not have permission to use this command."}})
    end
end, false)

-- Below is the Revive Logic



-- Credits --
-- Don't be weird.. Leave my Credits!!

print("^4[AJ:DeathSystem]^0 Death System by ImAidanJ")
print("^4[AJ:DeathSystem]^0 Discord: https://discord.gg/cGdUjQQnNT")
print("^4[AJ:DeathSystem]^0 Version: 1.0.0")