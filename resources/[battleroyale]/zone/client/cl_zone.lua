local zoneState = false

local currentSafezoneBlip

local currentSafezoneCoord
local currentSafezoneRadius
local targetSafezoneCoord
local targetSafezoneRadius

local zoneDamage = 5

function ResetSafezone()
    currentSafezoneCoord = false
    currentSafezoneRadius = false
    targetSafezoneCoord = false
    targetSafezoneRadius = false
end

function isPlayerOutOfZone()
    local pPos = GetEntityCoords(GetPlayerPed(PlayerId()))
    local pDistance = math.abs(GetDistanceBetweenCoords(playerPos.x, playerPos.y, 0, currentSafezoneCoord.x, currentSafezoneCoord.y, 0, false))
    local pDistance = math.abs(GetDistanceBetweenCoords(pPos.x, pPos.y, 0, currentSafezoneCoord.x, currentSafezoneCoord.y, 0, false))

    return pDistance > currentSafezoneRadius
end

function zoneNotification()
    local coolDown = 60 * 1000
    ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
    Citizen.Wait(7000)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 3 menit")
    Citizen.Wait(coolDown)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 2 menit")
    Citizen.Wait(coolDown)
    ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona akan pindah dalam waktu 1 menit")
    Citizen.Wait(coolDown)
end

RegisterNetEvent('vidigg:customZone')
AddEventHandler('vidigg:customZone', function(pZoneCoords, pRandomNum)
    local coolDown = 60 * 1000
    local randomNumIndex = 1

    ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
    Citizen.Wait(coolDown)
    zoneState = true
    TriggerEvent('vidigg:setCurrentSafezone', {
        x = pZoneCoords.x,
        y = pZoneCoords.y,
        z = 0,
        radius = 5000
    })
    zoneState = true
    zoneNotification()

    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 1500
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 1200
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 1200
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 1000
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 600
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 300
    })
    zoneNotification()

    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 150
    })
    zoneNotification()

    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "Zona Habis")
    randomNumIndex = randomNumIndex + 1
    TriggerEvent('vidigg:setTargetSafezone', {
        x = pZoneCoords.x + pRandomNum[randomNumIndex],
        y = pZoneCoords.y + pRandomNum[randomNumIndex],
        z = 0,
        radius = 0
    })
    TriggerEvent('chatMessage', '^1INFO ', {255, 255, 255}, "END")
end)

RegisterNetEvent('vidigg:setTargetSafezone')
AddEventHandler('vidigg:setTargetSafezone', function(pNextZone)
    targetSafezoneCoord = {
        x = pNextZone.x,
        y = pNextZone.y,
        z = pNextZone.z
    }

    targetSafezoneRadius = pNextZone.radius
    zoneDamage = zoneDamage + 3
    CreateTargetSafezoneBlip(targetSafezoneCoord, targetSafezoneRadius)
end)

RegisterNetEvent('vidigg:setCurrentSafezone')
AddEventHandler('vidigg:setCurrentSafezone', function(pSafezone)
    currentSafezoneCoord = {
        x = pSafezone.x,
        y = pSafezone.y,
        z = pSafezone.z
    }
    currentSafezoneRadius = pSafezone.radius
end)

CreateThread(function()
    while true do
        Citizen.Wait(10000)
        if zoneState then
            local pPed = PlayerPedId()

            if isPlayerOutOfZone(currentSafezoneCoord, currentSafezoneRadius) then
                local currentHealth = GetEntityHealth(pPed)
                local newHealth = math.min(currentHealth - zoneDamage)
                ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
                SetEntityHealth(pPed, newHealth)
            end
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

local IsSafezoneArriveAtTarget = true
local TargetSafezoneBlip = nil

function CreateTargetSafezoneBlip(tSafezoneCoord, tSafezoneRadius)
    TargetSafezoneBlip = SetSafeZoneBlip(TargetSafezoneBlip, tSafezoneCoord, tSafezoneRadius, 32)
    SetBlipPriority(TargetSafezoneBlip, 5)
end

local currentGameTime

CreateThread(function()
    while true do
        if targetSafezoneCoord and targetSafezoneRadius then
            if not currentGameTime then
                currentGameTime = GetGameTimer()
            end

            local deltaTime = GetTimeDifference(GetGameTimer(), currentGameTime)
            currentGameTime = GetGameTimer()
            local isArrive = true
            if (GetDistanceBetweenCoords(currentSafezoneCoord.x, currentSafezoneCoord.y, 0, targetSafezoneCoord.x, targetSafezoneCoord.y, 0, false) > 0.1) then
                currentSafezoneCoord = coord_lerp(currentSafezoneCoord, targetSafezoneCoord, 0.03 * (deltaTime / 5000))
                isArrive = isArrive and false
            end
            if (math.abs(currentSafezoneRadius - targetSafezoneRadius) > 0.1) then
                currentSafezoneRadius = math.lerp(currentSafezoneRadius, targetSafezoneRadius, 0.03 * (deltaTime / 5000))
                isArrive = isArrive and false
            end
            if isArrive == true then
                RemoveBlip(TargetSafezoneBlip)
            end
        end
        currentSafezoneBlip = SetSafeZoneBlip(currentSafezoneBlip, currentSafezoneCoord, currentSafezoneRadius, 1)
        SetBlipPriority(currentSafezoneBlip, 1)
        if zoneState then
            if currentSafezoneCoord and currentSafezoneRadius then
                if targetSafezoneCoord and targetSafezoneRadius then
                    if not currentGameTime then
                        currentGameTime = GetGameTimer()
                    end

                    local deltaTime = GetTimeDifference(GetGameTimer(), currentGameTime)
                    currentGameTime = GetGameTimer()
                    local isArrive = true
                    if (GetDistanceBetweenCoords(currentSafezoneCoord.x, currentSafezoneCoord.y, 0, targetSafezoneCoord.x, targetSafezoneCoord.y, 0, false) > 0.1) then
                        currentSafezoneCoord = coord_lerp(currentSafezoneCoord, targetSafezoneCoord, 0.03 * (deltaTime / 5000))
                        isArrive = isArrive and false
                    end
                    if (math.abs(currentSafezoneRadius - targetSafezoneRadius) > 0.1) then
                        currentSafezoneRadius = math.lerp(currentSafezoneRadius, targetSafezoneRadius, 0.03 * (deltaTime / 5000))
                        isArrive = isArrive and false
                    end
                    if isArrive == true then
                        RemoveBlip(TargetSafezoneBlip)
                    end
                end
                currentSafezoneBlip = SetSafeZoneBlip(currentSafezoneBlip, currentSafezoneCoord, currentSafezoneRadius, 1)
                SetBlipPriority(currentSafezoneBlip, 1)
            end
        else
            Citizen.Wait(10000)
        end
        Wait(20)
    end
end)

CreateThread(function()
    while true do
        Citizen.Wait(0)
        if currentSafezoneCoord and currentSafezoneRadius then
            DrawMarker(1, currentSafezoneCoord.x, currentSafezoneCoord.y, currentSafezoneCoord.z - 30, 0, 0, 0, 0, 0, 0, currentSafezoneRadius * 2.0, currentSafezoneRadius * 2.0, 250.0, 255, 0, 0, 150, 0, 0, 0, 0, 0, 0, 0)
        else
            Citizen.Wait(10000)
        end
    end
end)
