local function startAnim(ped, dictionary, anim)
    CreateThread(function()
      RequestAnimDict(dictionary)
      while not HasAnimDictLoaded(dictionary) do
        Citizen.Wait(0)
      end
        TaskPlayAnim(ped, dictionary, anim ,8.0, -8.0, -1, 50, 0, false, false, false)
    end)
end
--Helm Level 1
RegisterNetEvent('vidiganteng:helmlevel1')
AddEventHandler('vidiganteng:helmlevel1', function(skin)
    if not clothes then
    startAnim(cache.ped, "mp_masks@standard_car@ds@", "put_on_mask")
    Citizen.Wait(600)
    ClearPedSecondaryTask(cache.ped)
    clothes = true
    -- TriggerEvent('skinchanger:getSkin', function(skin)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            -- TriggerEvent('skinchanger:loadSkin', skin)
    if tonumber(skin.sex) == 0 then
    SetPedPropIndex(cache.ped, 0, 150, 0, 0)
    elseif tonumber(skin.sex) == 1 then 
        SetPedPropIndex(cache.ped, 0, 149, 0, 0)
        end
    -- end)
end)
    elseif clothes then
    clothes = false
    startAnim(cache.ped, "missheist_agency2ahelmet", "take_off_helmet_stand")
    Wait(1200)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if tonumber(skin.sex) == 0 then
        SetPedPropIndex(cache.ped, 0, 121, 0, 0)
        elseif tonumber(skin.sex) == 1 then 
            SetPedPropIndex(cache.ped, 0, 57, 0, 0)
        end
    end)
    ClearPedSecondaryTask(cache.ped)
    end
end)

RegisterNetEvent('vidiganteng:helmlevel2')
AddEventHandler('vidiganteng:helmlevel2', function(skin)
    if not clothes then
    startAnim(cache.ped, "mp_masks@standard_car@ds@", "put_on_mask")
    Citizen.Wait(600)
    ClearPedSecondaryTask(cache.ped)
    clothes = true
    -- TriggerEvent('skinchanger:getSkin', function(skin)
        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            -- TriggerEvent('skinchanger:loadSkin', skin)
    if tonumber(skin.sex) == 0 then
    SetPedPropIndex(cache.ped, 0, 117, 0, 0)
    elseif tonumber(skin.sex) == 1 then 
        SetPedPropIndex(cache.ped, 0, 116, 0, 0)
        end
    -- end)
end)
    elseif clothes then
    clothes = false
    startAnim(cache.ped, "missheist_agency2ahelmet", "take_off_helmet_stand")
    Wait(1200)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if tonumber(skin.sex) == 0 then
        SetPedPropIndex(cache.ped, 0, 121, 0, 0)
        elseif tonumber(skin.sex) == 1 then 
            SetPedPropIndex(cache.ped, 0, 57, 0, 0)
        end
    end)
    ClearPedSecondaryTask(cache.ped)
    end
end)

RegisterNetEvent('vidiganteng:helmlevel3')
AddEventHandler('vidiganteng:helmlevel3', function(skin)
    if not clothes then
    startAnim(cache.ped, "mp_masks@standard_car@ds@", "put_on_mask")
    Citizen.Wait(600)
    ClearPedSecondaryTask(cache.ped)
    clothes = true
    -- TriggerEvent('skinchanger:getSkin', function(skin)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        -- TriggerEvent('skinchanger:loadSkin', skin)
    if tonumber(skin.sex) == 0 then
    SetPedPropIndex(cache.ped, 0, 115, 0, 0)
    elseif tonumber(skin.sex) == 1 then 
        SetPedPropIndex(cache.ped, 0, 114, 0, 0)
        end
    -- end)
end)
    elseif clothes then
    clothes = false
    startAnim(cache.ped, "missheist_agency2ahelmet", "take_off_helmet_stand")
    Wait(1200)
    TriggerEvent('skinchanger:getSkin', function(skin)
        if tonumber(skin.sex) == 0 then
        SetPedPropIndex(cache.ped, 0, 121, 0, 0)
        elseif tonumber(skin.sex) == 1 then 
            SetPedPropIndex(cache.ped, 0, 57, 0, 0)
        end
    end)
    ClearPedSecondaryTask(cache.ped)
    end
end)
