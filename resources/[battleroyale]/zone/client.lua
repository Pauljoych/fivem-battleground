local currentSafezoneBlip
local currentSafezoneCoord
local currentSafezoneRadius
local targetSafezoneCoord
local targetSafezoneRadius

local zonajalan = false
local dizonapertama = false
local dizonakedua = false
local dizonaketiga = false
local dizonakeempat = false
local dizonakelima = false
local dizonakeenam = false
local dizonaketerakhir = false

function ResetSafezone()
    currentSafezoneCoord = nil
    currentSafezoneRadius = nil
    targetSafezoneCoord = nil
    targetSafezoneRadius = nil
end

function isPlayerOutOfZone()

    local playerPos = GetEntityCoords(GetPlayerPed(PlayerId()))
    local distance = math.abs(GetDistanceBetweenCoords(playerPos.x, playerPos.y, 0, currentSafezoneCoord.x, currentSafezoneCoord.y, 0, false))

    return distance > currentSafezoneRadius
end

RegisterNetEvent('brv:setCurrentSafezone')
AddEventHandler('brv:setTargetSafezone', function(tSafezone, timer)

    targetSafezoneCoord = {
        x = tSafezone.x,
        y = tSafezone.y,
        z = tSafezone.z
    }

    targetSafezoneRadius = tSafezone.radius
    CreateTargetSafezoneBlip(targetSafezoneCoord, targetSafezoneRadius)
end)

RegisterNetEvent('vidigg:customZone')
AddEventHandler('vidigg:customZone', function(pVector3)
    local tmpCoord = {
        x = pVector3.x,
        y = pVector3.y,
        z = pVector3.z,
        radius = 5000
    }

    local waktu = 60000 * 1

    ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
    Citizen.Wait(waktu)
    tmpCoord.radius = 5000
    TriggerEvent('brv:setCurrentSafezone', tmpCoord)

    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    zonajalan = true
    dizonapertama = true

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 1500
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    Citizen.Wait(7000)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    dizonakedua = true
    dizonapertama = false

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 1200
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    Citizen.Wait(7000)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    dizonaketiga = true
    dizonakedua = false

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 1000
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    Citizen.Wait(7000)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    dizonakeempat = true
    dizonaketiga = false

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 550
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    dizonakelima = true
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    dizonakelima = true
    dizonakeempat = false

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 350
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    Citizen.Wait(7000)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    dizonakeenam = true
    dizonakelima = false

    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Berpindah")
    tmpCoord.radius = 150
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(waktu)
    ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Habis")
    tmpCoord.radius = 0
    TriggerEvent('brv:setTargetSafezone', tmpCoord)
    dizonaketerakhir = true
    dizonakeenam = false
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "END")
end)

CreateThread(function()
    while zonajalan do
        Wait(Vidi.WaktuDiluarZona)
        local pPed = PlayerPedId()
        local playerPedIsOut = isPlayerOutOfZone(currentSafezoneCoord, currentSafezoneRadius)

        if playerPedIsOut then
            local health = GetEntityHealth(pPed)
            if dizonapertama then
                local newHealth = math.min(health - Vidi.DamageZonaKesatu)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonakedua the
                local newHealth = math.min(health - Vidi.DamageZonaKedua)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonaketiga then
                local newHealth = math.min(health - Vidi.DamageZonaKetiga)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonakeempat then
                local newHealth = math.min(health - Vidi.DamageZonaKeempat)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonakelima then
                local newHealth = math.min(health - Vidi.DamageZonaKelima)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonakeenam then
                local newHealth = math.min(health - Vidi.DamageZonaKeenam)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            elseif dizonaketerakhir then
                local newHealth = math.min(health - Vidi.DamageZonaKeterakhir)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            en
        end
    end
end)

function ChangeWeather(weather)
    ClearOverrideWeather()
    ClearWeatherTypePersist()
    SetWeatherTypePersist(weather)
    SetWeatherTypeNow(weather)
    SetWeatherTypeNowPersist(weather)
end

AddEventHandler('brv:setCurrentSafezone', function(cSafezone)

    currentSafezoneCoord = {
        x = cSafezone.x,
        y = cSafezone.y,
        z = cSafezone.z
    }
    currentSafezoneRadius = cSafezone.radius

end)

local IsSafezoneArriveAtTarget = true
local TargetSafezoneBlip = nil

function CreateTargetSafezoneBlip(tSafezoneCoord, tSafezoneRadius)
    TargetSafezoneBlip = SetSafeZoneBlip(TargetSafezoneBlip, tSafezoneCoord, tSafezoneRadius, 32)
    SetBlipPriority(TargetSafezoneBlip, 5)
end

-- currentSafezone move to targetSafezone update
CreateThread(function()

    local playerOOZAt = nil

    while true do

        if currentSafezoneCoord ~= nil and currentSafezoneRadius ~= nil then

            if targetSafezoneCoord ~= nil and targetSafezoneRadius ~= nil then

                if playerOOZAt == nil then
                    playerOOZAt = GetGameTimer()
                end

                local deltaTime = GetTimeDifference(GetGameTimer(), playerOOZAt) -- deltaTime is ms
                playerOOZAt = GetGameTimer()

                local isArrive = true

                if (GetDistanceBetweenCoords(currentSafezoneCoord.x, currentSafezoneCoord.y, 0, targetSafezoneCoord.x, targetSafezoneCoord.y, 0, false) > 0.1) then

                    currentSafezoneCoord = coord_lerp(currentSafezoneCoord, targetSafezoneCoord, Vidi.ZoneMoveSpeed * (deltaTime / 5000)) -- deltaTime/1000 <- change milliSecond to second

                    isArrive = isArrive and false
                end

                if (math.abs(currentSafezoneRadius - targetSafezoneRadius) > 0.1) then
                    currentSafezoneRadius = math.lerp(currentSafezoneRadius, targetSafezoneRadius, Vidi.ZoneRadiusMoveSpeed * (deltaTime / 5000))

                    isArrive = isArrive and false
                end

                if isArrive == true then
                    RemoveBlip(TargetSafezoneBlip)
                end
            end

            currentSafezoneBlip = SetSafeZoneBlip(currentSafezoneBlip, currentSafezoneCoord, currentSafezoneRadius, 1)
            SetBlipPriority(currentSafezoneBlip, 1)
        end

        Wait(20)

    end

end)

CreateThread(function()

    while true do

        if currentSafezoneCoord ~= nil and currentSafezoneRadius ~= nil then
            DrawMarker(1, currentSafezoneCoord.x, currentSafezoneCoord.y, currentSafezoneCoord.z - 30, 0, 0, 0, 0, 0, 0, currentSafezoneRadius * 2.0, currentSafezoneRadius * 2.0, 250.0, 255, 0, 0, 150, 0, 0, 0, 0, 0, 0, 0)
        end

        Wait(0)
    end

end)
