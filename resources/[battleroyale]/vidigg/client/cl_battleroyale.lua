-- // BATTLEROYALE \\ -- 
diingame = false
totalplayers = false

-- local announcements = false
-- local pengumumanbattleroyale = function(title, msg)
--     if announcements then return end
--     announcements = true
--     local ScaleformHandle = ESX.Scaleform.Utils.RequestScaleformMovie("STUNT_JUMPS")    
--     BeginScaleformMovieMethod(ScaleformHandle, "SHOW_SHARD_STUNT_JUMP") 
--     PushScaleformMovieMethodParameterString(title) 
--     PushScaleformMovieMethodParameterString(msg) 
--     EndScaleformMovieMethod() 
--     CreateThread(function()
--         while announcements do 
--             Wait(1)
--             DrawScaleformMovieFullscreen(ScaleformHandle, 255, 255, 255, 255) 
--         end
--     end)
--     -- Citizen.Wait(5000)
--     -- announcements = false
-- end

RegisterNetEvent('br:sebelummaen', function()
    -- pengumumanbattleroyale('HATI HATI YA')
    totalplayers = true
    PlaySoundFrontend(-1, 'COLLECTED', 'HUD_AWARDS', false)
    openbattleroyale()
end)

RegisterNetEvent('br:sebelummaen2', function()
    totalplayers = true
    PlaySoundFrontend(-1, 'COLLECTED', 'HUD_AWARDS', false)
    openbattleroyale2()
end)

function openbattleroyale()
    if not diingame then
        lib.registerContext({
            id = 'battleroyale',
            title = 'Batte Royale Menu',
            options = {{
                title = '🪂 Meluncur',
                description = 'Goodluck & Have Fun',
                arrow = false,
                icon = '',
                event = 'open:battleroyale'
            }}
        })
        lib.showContext('battleroyale')
    else
        ESX.ShowNotification('INFO', 'Kamu sedang berada di ingame Battle Royale, Menu Meluncur tidak Muncul', 2500, 'info')
        print('Kamu sedang berada di ingame Battle Royale, Menu Meluncur tidak Muncul')
    end
end

function openbattleroyale2()
    lib.registerContext({
        id = 'battleroyale2',
        title = 'Batte Royale Menu',
        options = {{
            title = '🪂 Meluncur',
            description = 'Goodluck & Have Fun',
            arrow = false,
            icon = '',
            event = 'open:battleroyale2'
        }}
    })
    lib.showContext('battleroyale2')
end

local coords = GetEntityCoords(cache.ped)

local posisiParasut = {
    [1] = {
        coords = vector3(-14.16, -701.32, 1940.8)
    },
    [2] = {
        coords = vector3(28.76, -717.04, 1940.8)
    },
    [3] = {
        coords = vector3(-296.92, -545.8, 1972.52)
    },
    [4] = {
        coords = vector3(-303.08, -594.76, 1926.08)
    },
    [5] = {
        coords = vector3(-303.08, -594.88, 1925.96)
    },
    [6] = {
        coords = vector3(-182.88, -364.32, 1934.0)
    },
    [7] = {
        coords = vector3(-71.84, -160.96, 1717.48)
    },
    [8] = {
        coords = vector3(-102.6, -218.92, 1734.72)
    },
    [9] = {
        coords = vector3(-188.0, -231.28, 1720.2)
    },
    [10] = {
        coords = vector3(97.76, -351.88, 1843.6)
    },
    [11] = {
        coords = vector3(-189.24, -40.68, 1906.12)
    },
    [12] = {
        coords = vector3(-189.12, -40.84, 1947.52)
    },
    [13] = {
        coords = vector3(-189.72, -40.16, 1911.6)
    },
    [14] = {
        coords = vector3(-14.16, -701.32, 1934.8)
    },
    [15] = {
        coords = vector3(-14.16, -701.32, 1925.8)
    }
    -- [16] = {coords = vector3(-14.16, -701.32, 1910.8)}, 
    -- [17] = {coords = vector3(-14.16, -701.32, 1880.8)}, 
    -- [18] = {coords = vector3(-14.16, -701.32, 1840.8)}, 
    -- [19] = {coords = vector3(-14.16, -701.32, 1910.8)}, 
    -- [20] = {coords = vector3(-14.16, -701.32, 1890.8)}, 
    -- [21] = {coords = vector3(-14.16, -701.32, 1990.8)}, 
    -- [22] = {coords = vector3(-14.16, -701.32, 1890.8)}, 
    -- [23] = {coords = vector3(-14.16, -701.32, 1799.8)}, 
    -- [24] = {coords = vector3(-14.16, -701.32, 1980.8)}, 
    -- [25] = {coords = vector3(-200.56, -75.8, 1971.0)}, 
    -- [26] = {coords = vector3(-190.56, -42.56, 1958.24)}, 
    -- [27] = {coords = vector3(-220.76, -33.68, 1958.24)}, 
    -- [28] = {coords = vector3(-222.12, -38.2, 1944.6)}, 
    -- [29] = {coords = vector3(-188.04, -48.28, 1944.56)}, 
    -- [30] = {coords = vector3(-189.84, -54.36, 1926.68)}, 
    -- [31] = {coords = vector3(-166.8, -52.32, 1951.24)}, 
    -- [32] = {coords = vector3(-175.52, -31.48, 1937.32)}, 
    -- [33] = {coords = vector3(-188.36, -28.32, 1906.0)}, 
    -- [34] = {coords = vector3(-184.24, -61.4, 1882.44)}, 
    -- [35] = {coords = vector3(-188.16, -52.64, 1877.64)}, 
    -- [36] = {coords = vector3(-235.88, -9.92, 1951.64)}, 
    -- [37] = {coords = vector3(-262.72, 26.84, 1935.24)}, 
    -- [38] = {coords = vector3(-242.16, 1.04, 1969.08)}, 
    -- [39] = {coords = vector3(-244.44, 41.16, 1930.68)}, 
    -- [40] = {coords = vector3(-285.92, 16.6, 1900.08)}, 
    -- [41] = {coords = vector3(-240.56, -35.56, 1946.2)}, 
    -- [42] = {coords = vector3(-257.44, -5.0, 1946.2)}, 
    -- [43] = {coords = vector3(-260.6, -16.32, 1947.04)}, 
    -- [44] = {coords = vector3(-258.12, -10.04, 1939.12)}, 
    -- [45] = {coords = vector3(-267.28, -9.36, 1946.16)}, 
}

local acak = math.random(1, 15)
local lagiparasutan = false

local function kasihParachute()
    color = {}
    color.r = math.random(0, 255)
    color.g = math.random(0, 255)
    color.b = math.random(0, 255)

    GiveWeaponToPed(cache.ped, GetHashKey('GADGET_PARACHUTE'), 1, false, true)
    SetPedParachuteTintIndex(cache.ped, math.random(0, 7))
    SetPlayerParachuteSmokeTrailColor(PlayerId(), color.r, color.g, color.b)
end

RegisterNetEvent('open:battleroyale', function()
    TriggerServerEvent('mectov:clear')
    SetPlayerInvincible(cache.playerId, true)
    -- print("cek")
    diingame = true
    totalplayers = true
    Wait(1200)
    TriggerServerEvent('addweapon:pistol')
    -- FreezeEntityPosition(cache.ped, true)
    -- Wait(1000, 3100)
    -- FreezeEntityPosition(cache.ped, false)
    kasihParachute()
    revivemen(cache.ped, GetEntityCoords(cache.ped), GetEntityHeading(cache.ped))
    SetEntityCoords(cache.ped, posisiParasut[acak].coords.x, posisiParasut[acak].coords.y, posisiParasut[acak].coords.z)
    -- SetEntityCoords(cache.ped, posisiParasut[1].coords.x, posisiParasut[1].coords.y, posisiParasut[1].coords.z)
    NetworkOverrideClockTime(12, 0, 0)
    SetPedArmour(cache.ped, 0)
    SetEntityHealth(cache.ped, GetEntityMaxHealth(cache.ped))
    -- SetWeatherTypeNow('extrasunny')
    -- SetWeatherTypeNowPersist('extrasunny')
    -- SetOverrideWeather('extrasunny')
    Wait(1000)
    announcements = false
    TriggerEvent('sip:oke')
    Wait(15000)
    -- print('cok')
    SetPlayerInvincible(cache.playerId, false)
    totalplayers = false
end)

RegisterNetEvent('open:battleroyale2', function()
    TriggerServerEvent('mectov:clear')
    -- print("cek")
    diingame = true
    totalplayers = true
    Wait(1200)
    SetPlayerInvincible(cache.playerId, false)
    TriggerServerEvent('addweapon:pistol')
    FreezeEntityPosition(cache.ped, true)
    Wait(1000, 3100)
    FreezeEntityPosition(cache.ped, false)
    kasihParachute()
    revivemen(cache.ped, GetEntityCoords(cache.ped), GetEntityHeading(cache.ped))
    -- SetEntityCoords(cache.ped, posisiParasut[acak].coords.x, posisiParasut[acak].coords.y, posisiParasut[acak].coords.z)
    SetEntityCoords(cache.ped, posisiParasut[1].coords.x, posisiParasut[1].coords.y, posisiParasut[1].coords.z)
    NetworkOverrideClockTime(12, 0, 0)
    SetPedArmour(cache.ped, 0)
    SetEntityHealth(cache.ped, GetEntityMaxHealth(cache.ped))
    -- SetWeatherTypeNow('extrasunny')
    -- SetWeatherTypeNowPersist('extrasunny')
    -- SetOverrideWeather('extrasunny')
    Wait(1000)
    TriggerEvent('sip:oke')
    -- print('cok')
    totalplayers = false
end)

-- CreateThread(function()
-- 	while true do
-- 		Wait(1)
-- 		if lagiparasutan then
-- 			for _, i in ipairs(GetActivePlayers()) do
-- 				if i ~= PlayerId() then
-- 				  local antaraped = GetPlayerPed(i)
-- 				  SetEntityNoCollisionEntity(cache.ped, antaraped, false)
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

RegisterNetEvent('sip:oke', function()
    TriggerEvent('skinchanger:getSkin', function(skin)
        if tonumber(skin.sex) == 0 then
            SetPedPropIndex(cache.ped, 0, 121, 0, 0)
        elseif tonumber(skin.sex) == 1 then
            SetPedPropIndex(cache.ped, 0, 57, 0, 0)
        end
    end)
end)

function revivemen(ped, coords, heading)
    SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
    -- SetEntityInvincible(ped, false)
    -- SetPlayerInvincible(ped, false)
    TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
    ClearPedBloodDamage(ped)

    ESX.UI.Menu.CloseAll()
end

RegisterNetEvent('leave:battleroyale')
AddEventHandler('leave:battleroyale', function()
    ESX.Game.Teleport(cache.ped, Vidi.LokasiLeaveBattleRoyale, function()
        diingame = false
        totalplayers = true
        announcements = false
        Wait(1000, 3000)
        revivemen(cache.ped, GetEntityCoords(cache.ped), GetEntityHeading(cache.ped))
        totalplayers = false
        -- TriggerServerEvent('rc:outbattleroyale')
        TriggerServerEvent('mectov:clear')
        ESX.ShowNotification('INFO', 'Keluar Ke Lobby', 2500, 'info')
        SetEntityHealth(cache.ped, GetEntityMaxHealth(cache.ped))
        SetPedArmour(cache.ped, 0)
    end)
end)

-- Disable Shoot From parachute
-- local canShoot = false

-- CreateThread(function()
-- 	while true do
-- 		local parachuteState = GetPedParachuteState(cache.playerId)
-- 		if parachuteState == 1 or parachuteState == 2 then
-- 			canShoot = true
-- 		elseif parachuteState == 3 then
-- 			canShoot = false
-- 		end
-- 		if canShoot then
-- 			DisableControlAction(0, 24, true)
-- 			DisableControlAction(0, 25, true)
-- 		end
-- 	end
-- end)
