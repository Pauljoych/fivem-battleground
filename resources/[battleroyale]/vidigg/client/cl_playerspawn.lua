-- // playerspawn \\ -- 
AddEventHandler('playerSpawned', function()
    SetPedArmour(cache.ped, 0)
    NetworkOverrideClockTime(12, 0, 0)
    SetEntityHealth(cache.ped, GetEntityMaxHealth(cache.ped))
    SetEntityVisible(PlayerPedId(), true, 0)
    TriggerEvent('sip:oke')
end)

lagimasukbro = false

RegisterNetEvent('esx:playerLoaded', function()
    Wait(4000)
    TriggerServerEvent('mectov:clear')
    SetWeatherTypePersist('CLEAR')
    SetWeatherTypeNow('CLEAR')
    SetWeatherTypeNowPersist('CLEAR')
    SetWeatherTypeNow('CLEAR')
    PlaySoundFrontend(-1, 'TIMER', 'HUD_FRONTEND_DEFAULT_SOUNDSET')
    SetEntityAlpha(cache.ped, 60, false)
    Wait(5000)
    ResetEntityAlpha(cache.ped)
    local mugshot, mugshotStr = ESX.Game.GetPedMugshot(PlayerPedId())
    ESX.ShowAdvancedNotification('Royal', '', 'WELCOME TO ~r~Royal Battleground', mugshotStr, 0, false, false, 90)
    UnregisterPedheadshot(mugshot)
    lagimasukbro = true
    TriggerServerEvent('addweapon:pistol')
    TriggerEvent('reset:kill')
    TriggerEvent('skinchanger:getSkin', function(skin)
        if tonumber(skin.sex) == 0 then
            SetPedPropIndex(cache.ped, 0, 121, 0, 0)
        elseif tonumber(skin.sex) == 1 then
            SetPedPropIndex(cache.ped, 0, 57, 0, 0)
        end
    end)
end)
