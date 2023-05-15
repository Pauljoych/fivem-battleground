-- CreateThread(function()
--     while true do
--         local bobok = 1000

--         if IsControlPressed(0, 303) then
--             local ped = PlayerPedId()
--             local playerCoords = GetEntityCoords(ped)

--             local nearbyPlayers = GetNeareastPlayers()
--                 for k, v in pairs(nearbyPlayers) do
--                     local x = table.unpack(v.coords)
--                     local x, y, z = table.unpack(v.coords)
--                     if (GetDistanceBetweenCoords( playerCoords, x, y, z ) < 2.0) then
--                     DrawText3D2(x, y, z + 1.03, v.playerId .. '') 
--                 end
--             end
--             bobok = 5
--         end  
--         Wait(bobok)
--     end
-- end)

-- function GetNeareastPlayers()
--     local players = {}

--     for _, i in ipairs(GetActivePlayers()) do        -- do stuff
--         table.insert(players, 
--         { 
--             playerName = GetPlayerName(i), 
--             playerId = GetPlayerServerId(i), 
--             coords = GetEntityCoords(GetPlayerPed(i)) 
--         })
--     end

--     return players
-- end

-- function DrawText3D2(x, y, z, text)
--     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
--     local pcoords = GetEntityCoords(PlayerPedId())
--     local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
--     local scale = 1.5 * (1 / dist) * (1 / GetGameplayCamFov()) * 100
--     local playerTalking = NetworkIsPlayerTalking(PlayerId(-1))

--     if GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1) < 5.5 and onScreen then

--         SetTextScale(scale, scale)
--         SetTextFont(4)
--         SetTextProportional(1)
--         if playerTalking then
--             SetTextColour(0,255,255,255)
--         else
--             SetTextColour(255, 255, 255, 255)
--         end
--         SetTextDropShadow(0, 0, 0, 0, 255)
--         SetTextDropShadow()
--         SetTextEdge(4, 0, 0, 0, 255)
--         SetTextOutline()
--         SetTextEntry("STRING")
--         SetTextCentre(1)
--         AddTextComponentString(text)
--         DrawText(_x, _y)
--     end
-- end
