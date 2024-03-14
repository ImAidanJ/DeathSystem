if Config.Death.ScreenMessage then
    RegisterNetEvent('AJ:playerDied')
    AddEventHandler('AJ:playerDied', function()
        local playerId = source
        SetNotificationTextEntry('STRING')
        AddTextComponentString(Config.Death.DeathMessage)
        DrawNotification(false, false)
    end)
end

if Config.Death.ChatMessage then
    RegisterNetEvent('AJ:playerDied')
    AddEventHandler('AJ:playerDied', function()
        local playerId = source
        TriggerClientEvent("chat:addMessage", playerId, {
            template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(235, 46, 46, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
            args = {Config.Death.DeathMessage}
        })
    end)
end

local isPlayerDead = false

-- Respawn Event Logic
RegisterNetEvent('AJ:Respawn')
AddEventHandler("AJ:Respawn", function()
    if isPlayerDead then
        local playerPed = GetPlayerPed(-1)
        local coords = GetRandomRespawnCoords()
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, true, false)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
        isPlayerDead = false
        TriggerEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
            args = {"^4[AJ:DeathSystem]^0 You have been respawned!"}
        })
    end
end)

-- Revive Event Logic
RegisterNetEvent('AJ:Revive')
AddEventHandler("AJ:Revive", function()
    if isPlayerDead then
        local playerPed = GetPlayerPed(-1)
        local coords = GetEntityCoords(playerPed)
        NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, true, false)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
        TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
        isPlayerDead = false
        TriggerEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
            args = {"^4[AJ:DeathSystem]^0 You have been revived!"}
        })
    end
end)

AddEventHandler('playerDied', function()
    isPlayerDead = true
end)

-- Gets coords from config
function GetRandomRespawnCoords()
    local randomIndex = math.random(1, #Config.Locations)
    return Config.Locations[randomIndex]
end
