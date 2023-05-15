local onlinePlayers, forceDraw = {}, false

CreateThread(function()
    TriggerServerEvent("vidigg:add-id")
    while true do
        Wait(5)
        if IsControlPressed(0, Vidi.ToogleID) then
            for k, v in pairs(oawoawawoaw()) do
                local x, y, z = table.unpack(v.coords)
                hmmmmantap(x, y, z + 1.1, v.playerId, 1.6)
                hmmmmantap(x, y, z + 1.20, v.topText, 1.0)
            end
        end
    end
end)

RegisterNetEvent('vidigg:client:add-id', function(identifier, playerSource)
    if playerSource then
        onlinePlayers[playerSource] = identifier
    else
        onlinePlayers = identifier
    end
end)

function hmmmmantap(x, y, z, text, newScale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        local lagingomong = NetworkIsPlayerTalking(PlayerId())
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = newScale * (1 / dist) * (1 / GetGameplayCamFov()) * 100
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        -- if lagingomong then
        -- SetTextColour(0, 173, 130, 0.8)
        -- else
        SetTextColour(255, 255, 255, 255)
        -- end
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function oawoawawoaw()
    local playerPed = PlayerPedId()
    local players_clean = {}
    local playerCoords = GetEntityCoords(playerPed)
    if IsPedInAnyVehicle(playerPed, false) then
        local playersId = tostring(GetPlayerServerId(PlayerId()))
        table.insert(players_clean, {topText = onlinePlayers[playersId], playerId = playersId, coords = playerCoords} )
    else
        local players, _ = adadadada(playerCoords, Vidi.drawDistance)
        for i = 1, #players, 1 do
            local playerServerId = GetPlayerServerId(players[i])
            local player = GetPlayerFromServerId(playerServerId)
            local ped = GetPlayerPed(player)
            if IsEntityVisible(ped) then
                for x, identifier in pairs(onlinePlayers) do 
                    if x == tostring(playerServerId) then
                        table.insert(players_clean, {topText = identifier:upper(), playerId = playerServerId, coords = GetEntityCoords(ped)})
                    end
                end
            end
        end
    end
   
    return players_clean
end

function adadadada(coords, area)
	local players, playersInArea = GetPlayers(), {}
	local coords = vector3(coords.x, coords.y, coords.z)
	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end
	return playersInArea
end

function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end