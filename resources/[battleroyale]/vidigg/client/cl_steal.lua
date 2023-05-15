
-- // STEAL PLAYER \\ -- 
RegisterNetEvent('geledah:orang')
AddEventHandler('geledah:orang', function()
    geledahorangmbut()
    -- TriggerEvent('vd-inventory:client:geledah')
end)

RegisterNetEvent('LagiRevive', function(data)
    revivecoawefjkaf = data
end)

RegisterNetEvent('ngzona', function(data)
    affsasafafa = data
end)

function geledahorangmbut()
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    local targetPed = GetPlayerPed(closestPlayer)
    if IsPedDeadOrDying(targetPed, true) then
    if not affsasafafa and not IsPedDeadOrDying(cache.ped) then
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
    geledahboy(closestPlayer)
    loadAnimDict('mp_missheist_countrybank@nervous')
      TaskPlayAnim(cache.ped, "mp_missheist_countrybank@nervous", "nervous_idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
      Citizen.Wait(10000)
      ClearPedTasks(cache.ped)
    else 
        ESX.ShowNotification("INFO", "Tidak ada orang disekitarmu!", 2000, 'info')
    end
else
    ESX.ShowNotification("INFO", "Tidak dapat melakukan itu", 2000, 'info')
        end
    else
        ESX.ShowNotification("INFO", "Tidak bisa melakukan itu", 4000, 'info')
    end 
end


function geledahboy(closestPlayer)
    ESX.UI.Menu.CloseAll()
    TriggerEvent("dream-inventory:openPlayerInventory", GetPlayerServerId(closestPlayer), GetPlayerName(closestPlayer))
end

-- RegisterCommand("steal", function(src, args, raw)
--     geledahorangmbut()
-- end)

function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

-- RegisterNetEvent('vd-inventory:client:geledah')
-- AddEventHandler('vd-inventory:client:geledah', function()
--     local terdekat, Jarak = ESX.Game.GetClosestPlayer()
--     local orang = GetPlayerServerId(terdekat)
--     local targetPed = GetPlayerPed(terdekat)
--     if IsPedDeadOrDying(targetPed, true) then
--     if not affsasafafa and not IsPedDeadOrDying(cache.ped) then
--     if terdekat ~= -1 and Jarak <= 3.0 then
--         loadAnimDict("mp_missheist_countrybank@nervous")
--         TaskPlayAnim(PlayerPedId(), "mp_missheist_countrybank@nervous", "nervous_idle", 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
--         TriggerServerEvent('vidigg:server:geledah', orang)
--     else 
--         ESX.ShowNotification("LMAO FFA", "Tidak ada orang disekitarmu!", 2000, 'info')
--     end
-- else
--     ESX.ShowNotification("LMAO FFA", "Tidak dapat melakukan itu", 2000, 'info')
--         end
--     else
--         ESX.ShowNotification("LMAO FFA", "Tidak bisa melakukan itu", 4000, 'info')
--     end 
-- end)
