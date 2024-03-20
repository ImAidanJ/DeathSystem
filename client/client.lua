--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


-- VARIBALES
local isPlayerDead = false
local addIP = Config.Log.IncludeIP
local addID = Config.Log.IncludeID
local addLic = Config.Log.IncludeLicense
local ReviveMessage = Config.Revive.ReviveMessage
local RespawnMessage = Config.Respawn.RespawnMessage


 -- Revive Event called when /revive or /adrevive is used
 RegisterNetEvent('AJ:Revive')
 AddEventHandler("AJ:Revive", function()
    local player = GetPlayerPed(-1)
    local coords = GetEntityCoords(player)
    isPlayerDead = false
    SetPlayerInvisibleLocally(player, true)
    Citizen.Wait(200)
    ClearPedTasks(player)
    SetPlayerInvisibleLocally(player, false)
    SetEntityCoordsNoOffset(player, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, true, false)
    SetEntityHealth(player, 200)
    Citizen.Wait(500)
    TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
    args = {ReviveMessage}})
 end)
 

 -- Respawn Event called when /respawn or /adrespawn is used
 RegisterNetEvent('AJ:Respawn')
 AddEventHandler("AJ:Respawn", function()
    local player = GetPlayerPed(-1)
    isPlayerDead = false
    DoScreenFadeOut(3000)
    Citizen.Wait(3000)
    SetEntityHealth(player, 200)
    local respawnLocation = GetRandomRespawnLocation()
    SetEntityCoords(player, respawnLocation.x, respawnLocation.y, respawnLocation.z, false, false, false, false)
    DoScreenFadeIn(3000)
    FreezeEntityPosition(player, false)
    ResetPedVisibleDamage(player)
    Citizen.Wait(500)
    TriggerClientEvent("chat:addMessage", source, { template = '<div style="padding: 0.5vw; text-align: center; margin: 0.5vw; background-color: rgba(255, 255, 0, 0.6); border-radius: 3px; color: white;"><b>{0}</b></div>',
    args = {RespawnMessage}})
 end)


 -- Log Event called when any command is used
 RegisterNetEvent('AJ:LOG')
 AddEventHandler('AJ:LOG', function(CommandName)
     local playerId = source
     local playerName = GetPlayerName(playerId)
     local playerIp = GetPlayerEndpoint(playerId)
     local playerLicenses = GetPlayerIdentifiers(playerId)
 
     local logMessage = "Command Used: " .. CommandName .. "\nPlayer Name: " .. playerName
 
     if addIP then
         logMessage = logMessage .. "\nPlayer IP: " .. playerIp
     end
 
     if addID then
         logMessage = logMessage .. "\nPlayer ID: " .. playerId
     end
 
     if addLic then
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

 --[[
TODO: Add random coords index to respawn command(Line 48)
 --]]