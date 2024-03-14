RegisterNetEvent('AJ:Respawn')
AddEventHandler("AJ:Respawn", function()
    local playerPed = GetPlayerPed(-1)
    local coords = GetRandomRespawnCoords()
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, true, false)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
    TriggerEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {"^4[AJ:DeathSystem]^0"..Config.Respawn.RespawnMessage}
    })
end)

RegisterNetEvent('AJ:Revive')
AddEventHandler("AJ:Revive", function()
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, true, false)
    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
    TriggerEvent('chat:addMessage', -1, {
        template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {"^4[AJ:DeathSystem]^0 "..Config.Revive.ReviveMessage}
    })
end)


function GetRandomRespawnCoords()
    local randomIndex = math.random(1, #Config.Locations)
    return Config.Locations[randomIndex]
end
