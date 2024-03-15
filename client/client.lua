local Prefix = "^4[AJ:DeathSystem]^0"


if Config.Death.ScreenMessage then
    RegisterNetEvent('AJ:playerDied')
    AddEventHandler('AJ:playerDied', function()
        SetNotificationTextEntry('STRING')
        AddTextComponentSubstringPlayerName(Config.Death.DeathMessage)
        DrawNotification(false, false)
    end)
else
    TriggerClientEvent("chat:addMessage", source, {
        template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(235, 46, 46, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
        args = {Config.Death.DeathMessage}
    })
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
        Citizen.Wait(500)
        RemoveNotification(notification)
        isPlayerDead = false
        TriggerEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
            args = {Prefix.." You have been respawned!"}
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
        Citizen.Wait(500)
        RemoveNotification(notification)
        isPlayerDead = false
        TriggerEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(46, 235, 94, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
            args = {Prefix.." You have been revived!"}
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


RegisterNetEvent('AJ:LOG')
AddEventHandler('AJ:LOG', function(CommandName)
    local playerId = source
    local playerName = GetPlayerName(playerId)
    local playerIp = GetPlayerEndpoint(playerId)
    local playerLicenses = GetPlayerIdentifiers(playerId)

    local logMessage = "Command Used: " .. CommandName .. "\nPlayer Name: " .. playerName

    if Config.Log.IncludeIP then
        logMessage = logMessage .. "\nPlayer IP: " .. playerIp
    end

    if Config.Log.IncludeID then
        logMessage = logMessage .. "\nPlayer ID: " .. playerId
    end

    if Config.Log.IncludeLicense then
        logMessage = logMessage .. "\nPlayer Licenses:\n" .. table.concat(playerLicenses, "\n")
    end

    local embed = {
        title = "AJ:DeathSystem",
        description = logMessage,
        color = 3447003
    }

    PerformHttpRequest(Config.Log.Webhook, function(statusCode, response, headers)
    end, 'POST', json.encode({embeds = {embed}}), { ['Content-Type'] = 'application/json' })
end)


