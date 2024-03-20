--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


-- FUNCTION CONFIG
Function = {}
Function.Prefix = "^4[AJ:DeathSystem]^0"
Function.ResourceName = "AJDeathSystem"
Function.UpdatePath = "/ImAidanJ/DeathSystem"
Function.Version = "1.0.0"


-- Debug Mode
Debug = {}
Debug.Enabled = true


-- VARIBLES
local currentResource = GetCurrentResourceName()
local resourceName = Function.ResourceName
local updatePath = Function.UpdatePath
local version = Function.Version


Citizen.CreateThread( function()

    function checkVersion(err, newVersion, headers)
        curVersion = version
    
        if curVersion ~= newVersion and tonumber(curVersion) < tonumber(newVersion) then
            print("\n^1[WARNING]^7"..resourceName.." is outdated, Please Install the Latest Version.")
            print("^1[WARNING]^7 Your Version: "..curVersion.."\nNew Version: "..newVersion.."\nInstall Here --> https://github.com"..updatePath.."")
        elseif tonumber(curVersion) > tonumber(newVersion) then
            print("^1[WARNING]^7 "..resourceName.."is not in sync with Git, Reinstall to resync with git.")
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version.lua", checkVersion, "GET")

end)


Citizen.CreateThread( function() 

    function checkName()
        if currentResourceName ~= resourceName then
            print("^1[ERROR]^7 Incorrect resource name detected. Shutting down the resource...")
            print("^1[ERROR]^7 Resource must be named "..resourceName.." to work.")
            StopResource(currentResourceName)
            return
        end
    end

end)


Citizen.CreateThread( function()

    function debugCheck()
        if Debug.Enabled then
            print("^1[WARNING]^7 "..resourceName.." is currently in debug mode.")
        end
    end

end)


-- OTHER FUNCTIONS BELOW THIS MARK --


function text(input)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(0.5, 0.5)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextOutline()
    SetTextJustification(0)
    SetTextEntry('STRING')
    AddTextComponentString(input)
    DrawText(0.5, 0.9)
end

function FiveMAlert(message)
    SetTextComponentFormat('STRING')
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function playerDead(null)
    if isPlayerDead == true then
        FiveMAlert("/revive to revive | /respawn to respawn")
        text(Config.DeathMessage)
    end
end

function GetRandomRespawnLocation()
    local locations = Config.Respawn.Location
    local randomIndex = math.random(1, #locations)
    return locations[randomIndex]
end