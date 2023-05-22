-- // looping \\ -- 
CreateThread(function()

    -- // map zoom data \\ --
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0)
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0)

    Citizen.InvokeNative(ADD_TEXT_ENTRY, 'FE_THDR_GTAO', 'Royal BATTLEGROUND | Discord : coming soon ')

    while true do
        Wait(5)
        for _, player in pairs(GetActivePlayers()) do
            if player ~= PlayerId() then
                local ped = PlayerPedId()
                local ped2 = GetPlayerPed(player)
                local veh = GetVehiclePedIsIn(ped2, false)
                SetEntityNoCollisionEntity(ped, veh, true)
                SetEntityNoCollisionEntity(veh, ped, true)
            end
        end

        local vehicle = GetVehiclePedIsIn(cache.ped, false)
        local weaponsVidi = Vidi.DamageSenjata[GetSelectedPedWeapon(cache.ped)] -- damage senjata

        -- SetVehicleDamageModifier(vehicle, 0.0)
        -- SetEntityCanBeDamaged(vehicle, false)
        -- local parachute = 
        -- SetEntityCanBeDamaged(`GADGED_PARACHUTE`, false)

        SetPedSuffersCriticalHits(cache.ped, true) -- kepala 1 hit
        NetworkOverrideClockTime(12, 0, 0) -- jam 12
        SetPedUsingActionMode(cache.ped, false, -1, 'DEFAULT_ACTION') -- movement player

        -- SetWeatherTypeNow("EXTRASUNNY")
        -- SetWeatherTypeNowPersist("EXTRASUNNY")
        -- SetOverrideWeather("EXTRASUNNY")

        -- // WARLOK KENDARAAN \\ -- 
        SetVehicleDensityMultiplierThisFrame(0.0) -- set traffic density to 0 
        SetPedDensityMultiplierThisFrame(0.0)
        SetRandomVehicleDensityMultiplierThisFrame(7.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
        SetParkedVehicleDensityMultiplierThisFrame(7.0) -- set random parked vehicles (parked car scenarios) to 0
        SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
        SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
        SetRandomBoats(false) -- Stop random boats from spawning in the water.
        SetCreateRandomCops(false) -- disable random cops walking/driving around.
        SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
        SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
        StartAudioScene('CHARACTER_CHANGE_IN_SKY_SCENE')
        SetAudioFlag('PoliceScannerDisabled', true);

        if GetEntityMaxHealth(cache.ped) ~= 200 then -- darah full
            SetEntityMaxHealth(cache.ped, 200)
            SetEntityHealth(cache.ped, 200)
        end

        if IsPedInAnyVehicle(cache.ped, false) then -- disable helm
            SetPedConfigFlag(cache.ped, 35, false)
        end

        if IsPedOnFoot(cache.ped) then -- minimap
            SetRadarZoom(1100)
        end

        if IsPedInAnyVehicle(cache.ped, true) then -- minimap
            SetRadarZoom(1100)
        end

        if weaponsVidi then -- damage senjata
            N_0x4757f00bc6323cfe(weaponsVidi.Senjata, weaponsVidi.Damage)
        end

        if not IsPedArmed(cache.ped, 1) and (GetSelectedPedWeapon(cache.ped) ~= weapon_unarmed) then -- anti klik R
            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)
        end
    end
end)
