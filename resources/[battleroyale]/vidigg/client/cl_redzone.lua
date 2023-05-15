local zones = Vidi.LokasiRedzone

local redzoneON = false

local function BlipRedzone()
    local zone = AddBlipForRadius(zones.x, zones.y, zones.z, 130.0)
    local blip = AddBlipForCoord(zones.x, zones.y, zones.z)
    SetBlipSprite(zone, 9)
    SetBlipAlpha(zone, 100)
    SetBlipColour(zone, 1)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('REDZONE')
    SetBlipSprite(blip, 303)
    EndTextCommandSetBlipName(blip)
end

RegisterNetEvent('vidigg:client:RedzoneOFF', function()
    redzoneON = true
end)

local dizonaRedzone = false

CreateThread(function()
    BlipRedzone()
    while true do
        Wait(5)
        local ya = GetEntityCoords(cache.ped)
        local jrk = #(zones - ya)

        if jrk < 130.0 then
            dizonaRedzone = true
        else
            dizonaRedzone = false
        end

        if redzoneON then
            dizonaRedzone = false
            RemoveBlip(blip)
            RemoveBlip(zone)
        end
    end
end)

RegisterNetEvent('client:kasihloot', function()
    if dizonaRedzone then
        TriggerServerEvent('vidigg:kasihlooting:diredzone')
    else
        TriggerServerEvent('vidigg:kasihlooting:diluarredzone')
    end
end)

local kordinatredzoneledakan = {
    [1] = vector3(404.64, -1422.52, 29.44),
    [2] = vector3(442.68, -1491.08, 29.32),
    [3] = vector3(433.28, -1498.04, 29.2),
    [4] = vector3(432.24, -1512.4, 29.28),
    [5] = vector3(425.24, -1520.92, 29.28),
    [6] = vector3(415.56, -1540.4, 29.32),
    [7] = vector3(385.24, -1531.64, 29.36),
    [8] = vector3(385.24, -1531.64, 29.36),
    [9] = vector3(388.6, -1505.92, 29.2),
    [10] = vector3(451.84, -1502.32, 29.28),
    [11] = vector3(445.92, -1495.48, 29.28),
    [12] = vector3(442.04, -1490.64, 29.32),
    [13] = vector3(436.2, -1461.88, 29.24),
    [14] = vector3(483.44, -1450.88, 29.28),
    [15] = vector3(487.48, -1494.76, 29.32),
    [16] = vector3(488.16, -1505.44, 29.32),
    [17] = vector3(488.36, -1511.8, 29.72),
    [18] = vector3(466.0, -1540.12, 29.28),
    [19] = vector3(443.96, -1556.2, 29.28),
    [20] = vector3(469.96, -1585.96, 29.28),
    [21] = vector3(438.72, -1525.84, 29.28),
    [22] = vector3(454.24, -1513.44, 29.28),
    [23] = vector3(453.76, -1527.52, 29.0),
    [24] = vector3(487.64, -1547.12, 29.12),
    [25] = vector3(351.6, -1555.36, 29.16)
}

local announcements = false
local awasredzonedek = function(title, msg)
    if announcements then
        return
    end
    announcements = true
    local ScaleformHandle = ESX.Scaleform.Utils.RequestScaleformMovie("STUNT_JUMPS")
    BeginScaleformMovieMethod(ScaleformHandle, "SHOW_SHARD_STUNT_JUMP")
    PushScaleformMovieMethodParameterString(title)
    PushScaleformMovieMethodParameterString(msg)
    EndScaleformMovieMethod()
    CreateThread(function()
        while announcements do
            Wait(1)
            DrawScaleformMovieFullscreen(ScaleformHandle, 255, 255, 255, 255)
        end
    end)
    -- Citizen.Wait(5000)
    -- announcements = false
end

RegisterNetEvent('vidi:client:ledakanredzone', function()
    -- -- if dizonaRedzone then
    ESX.ShowNotification("WARNING", "Area Redzone akan mengalami Ledakan dalam beberapa Detik Lagi !!", 3000, 'error')
    PlaySoundFrontend(-1, "3_2_1", "HUD_MINI_GAME_SOUNDSET", false)
    Wait(3000)
    if dizonaRedzone then
        awasredzonedek('KAMU BERADA DI ~r~REDZONE, ~w~HATI HATI ~b~DANGER ZONE !')
        PlaySoundFrontend(-1, "COLLECTED", "HUD_AWARDS", false)
        Wait(5000)
        announcements = false
    end
    Wait(15000)
    AddExplosion(kordinatredzoneledakan[1], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[5], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[2], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[7], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[3], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[1], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[4], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[20], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[5], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[25], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[6], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[19], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[7], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[8], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[8], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[6], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[9], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[15], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[10], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[4], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[11], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[14], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[12], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[16], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[13], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[17], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[14], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[19], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[15], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[18], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[16], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[23], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[17], 4, 0.9, 1, 0, false, 0)
    AddExplosion(kordinatredzoneledakan[24], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[18], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[19], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[20], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[21], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[22], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[23], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[24], 4, 0.9, 1, 0, false, 0)
    Wait(6000)
    AddExplosion(kordinatredzoneledakan[25], 4, 0.9, 1, 0, false, 0)
    if dizonaRedzone then
        ESX.ShowNotification("Royal", "Ledakan Redzone telah berakhir", 5500, 'success')
    end
    -- end
end)

