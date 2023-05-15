-- LocalPlayer.state.lagiSibuk = false
-- // USE ITEM \\ --
RegisterNetEvent('esx_ambulancejob:useItem')
AddEventHandler('esx_ambulancejob:useItem', function(itemName)
    ESX.UI.Menu.CloseAll()

    LocalPlayer.state.lagiSibuk = true
    if itemName == 'medikit' then
        local berhasil = lib.progressCircle({
            duration = 7000,
            label = 'Menggunakan Medkit',
            useWhileDead = false,
            position = 'bottom',
            canCancel = true,
            disable = {
                car = false,
                combat = true,
                mouse = false,
                move = false
            },
            anim = {
                dict = 'missheistdockssetup1clipboard@idle_a',
                clip = 'idle_a'
            },
            prop = {
                model = prop_ld_health_pack,
                pos = vec3(0.03, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            }

        })
        if berhasil then
            LocalPlayer.state.lagiSibuk = false
            TriggerEvent('esx_ambulancejob:heal', 'big', true)
            ESX.ShowNotification("INFO", "Berhasil Menggunakan Medkit", 2500, 'success')
            -- ESX.ShowNotification("Berhasil Menggunakan Armor Level 1")
            TriggerServerEvent('vidigg:server:removeMedikit')
        else
            LocalPlayer.state.lagiSibuk = false
            ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
        end
    elseif itemName == 'bandage' then
        LocalPlayer.state.lagiSibuk = true
        local berhasil = lib.progressCircle({
            duration = 4000,
            label = 'Menggunakan Perban',
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = false,
                combat = true,
                mouse = false,
                move = false
            },
            anim = {
                dict = 'amb@world_human_clipboard@male@idle_a',
                clip = 'idle_c'
            },
            prop = {
                model = prop_ld_health_pack,
                pos = vec3(0.03, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            }
        })
        if berhasil then
            LocalPlayer.state.lagiSibuk = false
            TriggerEvent('esx_ambulancejob:heal', 'small', true)
            ESX.ShowNotification("INFO", "Berhasil Menggunakan Perban", 2500, 'success')
            TriggerServerEvent('vidigg:server:removeBandage')
            -- ESX.ShowNotification("Berhasil Menggunakan Armor Level 1")
        else
            LocalPlayer.state.lagiSibuk = false
            ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
        end
    end
end)

RegisterNetEvent('vxd-item:armor')
AddEventHandler('vxd-item:armor', function()
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 2200,
        label = 'Menggunakan Armor Level 1',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
            combat = true,
            mouse = false,
            move = false
        },
        anim = {
            dict = 'oddjobs@basejump@ig_15',
            clip = 'puton_parachute'
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        -- SetPedArmour(cache.ped, 35)
        AddArmourToPed(cache.ped, 50)
        ESX.ShowNotification("INFO", "Berhasil Menggunakan Armor Level 1", 2500, 'success')
        TriggerServerEvent('vidigg:server:removeArmor')
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
    end
end)

RegisterNetEvent('vxd-item:armor2')
AddEventHandler('vxd-item:armor2', function()
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 4000,
        label = 'Menggunakan Armor Level 2',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
            combat = true,
            mouse = false,
            move = false
        },
        anim = {
            dict = 'oddjobs@basejump@ig_15',
            clip = 'puton_parachute'
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        AddArmourToPed(cache.ped, 100)
        ESX.ShowNotification("INFO", "Berhasil Menggunakan Armor Level 2", 2500, 'success')
        TriggerServerEvent('vidigg:server:removeArmor2')
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
    end
end)

RegisterNetEvent('vxd-item:armor3')
AddEventHandler('vxd-item:armor3', function()
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 5200,
        label = 'Menggunakan Armor Level 3',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
            combat = true,
            mouse = false,
            move = false
        },
        anim = {
            dict = 'oddjobs@basejump@ig_15',
            clip = 'puton_parachute'
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        AddArmourToPed(cache.ped, 100)
        ESX.ShowNotification("INFO", "Berhasil Menggunakan Armor Level 3", 2500, 'success')
        TriggerServerEvent('vidigg:server:removeArmor3')
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
    end
end)

RegisterNetEvent('vxd-item:airdrop')
AddEventHandler('vxd-item:airdrop', function()
    ESX.ShowNotification("INFO", "Berhasil memanggil Airdrop", 2500, 'info')
    local playerCoords = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, 10.0, 0.0)
    TriggerEvent("crateDrop", false, 400.0, {
        ["x"] = playerCoords.x,
        ["y"] = playerCoords.y,
        ["z"] = playerCoords.z
    })
end)

local masihada = false

CreateThread(function()
    while true do
        Wait(12000)
        if masihada == true then
            local getdarah = GetEntityHealth(cache.ped)
            local darah = 5
            SetEntityHealth(cache.ped, getdarah + darah)
            ESX.ShowNotification("INFO", "Darah Bertambah " .. darah .. "%", 2500, 'success')
        else
        end
    end
end)

RegisterNetEvent('vxd-item:energydrink')
AddEventHandler('vxd-item:energydrink', function()
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 2500,
        label = 'Meminum Energydrink',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
            combat = true,
            mouse = false,
            move = false
        },
        anim = {
            dict = 'mp_player_intdrink',
            clip = 'loop_bottle'
        },
        prop = {
            model = prop_cs_paper_cup,
            pos = vec3(0.03, 0.03, 0.02),
            rot = vec3(0.0, 0.0, -1.5)
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Berhasil Meminum Energydrink", 2500, 'success')
        TriggerServerEvent('vidigg:server:removeEnergydrink')
        masihada = true
        Wait(40000)
        masihada = false
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
    end
end)

RegisterNetEvent('vxd-item:clipclip')
AddEventHandler('vxd-item:clipclip', function()
    LocalPlayer.state.lagiSibuk = true
    if IsPedArmed(cache.ped, 4) then
        local berhasil = lib.progressCircle({
            position = 'bottom',
            duration = 4000,
            label = 'Reload Senjata',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = false,
                combat = true,
                mouse = false,
                move = false
            },
            anim = {
                dict = 'mp_arresting',
                clip = 'a_uncuff'
            }
        })
        if berhasil then
            LocalPlayer.state.lagiSibuk = false
            AddAmmoToPed(cache.ped, GetSelectedPedWeapon(cache.ped), 46)
            ESX.ShowNotification("INFO", "Berhasil Menggunakan Clip", 2500, 'success')
            TriggerServerEvent('vidigg:server:removeClip')
        else
            LocalPlayer.state.lagiSibuk = false
            ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
        end
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Tidak memiliki senjata di tangan anda", 2500, 'error')
    end
end)

RegisterNetEvent('vxd-item:painkiller')
AddEventHandler('vxd-item:painkiller', function()
    if not cache.vehicle then
        LocalPlayer.state.lagiSibuk = true
        local berhasil = lib.progressCircle({
            position = 'bottom',
            duration = 2500,
            label = 'Meminum Painkiller',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = false,
                combat = true,
                mouse = false,
                move = false
            },
            anim = {
                dict = 'mp_player_intdrink',
                clip = 'loop_bottle'
            },
            prop = {
                model = prop_cs_paper_cup,
                pos = vec3(0.03, 0.03, 0.02),
                rot = vec3(0.0, 0.0, -1.5)
            }
        })
        if berhasil then
            LocalPlayer.state.lagiSibuk = false
            TriggerServerEvent('vidigg:server:removePainkiller')
            SetRunSprintMultiplierForPlayer(cache.playerId, 1.20)
            Citizen.SetTimeout(10000, function()
                SetRunSprintMultiplierForPlayer(cache.playerId, 1.00)
                ESX.ShowNotification("INFO", "Painkiller Habis", 2500, 'info')
            end)
        else
            LocalPlayer.state.lagiSibuk = false
            ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
        end
    end
end)

RegisterNetEvent('vxd-item:repairkit')
AddEventHandler('vxd-item:repairkit', function()
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 7000,
        label = 'Memperbaiki Kendaraan',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = false,
            combat = true,
            mouse = false,
            move = true
        },
        anim = {
            dict = 'mini@repair',
            clip = 'fixing_a_player'
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        TriggerEvent('vidigg:client:pakaiRepairkit')
        TriggerServerEvent('vidigg:server:removeRepairKit')
    else
        LocalPlayer.state.lagiSibuk = false
        ESX.ShowNotification("INFO", "Dibatalkan", 2500, 'error')
    end
end)

RegisterNetEvent('vidigg:client:pakaiRepairkit')
AddEventHandler('vidigg:client:pakaiRepairkit', function()
    local coords = GetEntityCoords(cache.ped)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 5.0, 0, 71)
    SetVehicleFixed(vehicle)
    SetVehicleEngineOn(vehicle, true, true)
    SetVehicleEngineHealth(vehicle, 1000.0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    ESX.ShowNotification("INFO", "Kendaraan Berhasil di Perbaiki", 2500, 'info')
end)

