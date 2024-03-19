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

function 5mAlert(message)
    SetTextComponentFormat('STRING')
    AddTextComponentString(message)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function playerDead(null)
    if isPlayerDead == true then
        5mAlert("/revive to revive | /respawn to respawn")
    end
end

function GetRandomRespawnCoords()
    local randomIndex = math.random(1, #Config.Locations)
    return Config.Locations[randomIndex]
end