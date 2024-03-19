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


-- VARIBALES
local isPlayerDead = false

local addIP = Config.Log.IncludeIP
local addID = Config.Log.IncludeID
local addLic = Config.Log.IncludeLicense


 -- Revive Event called when /revive or /adrevive is used
 RegisterNetEvent('AJ:Revive')
 AddEventHandler("AJ:Revive", function()

    -- Revive Logic Here

 end)
 

 -- Respawn Event called when /respawn or /adrespawn is used
 RegisterNetEvent('AJ:Respawn')
 AddEventHandler("AJ:Respawn", function()

    -- Respawn Logic Here

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