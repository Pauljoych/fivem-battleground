-- // airdrop \\ -- 
local pilot, aircraft, parachute, crate, pickup, blip, soundID
local requiredModels = {"p_cargo_chute_s", "prop_drop_armscrate_01", "titan", "s_m_m_pilot_02", "prop_box_wood02a_pu"}
local getCrate = true
local itemObj = {}

RegisterNetEvent("crateDrop")
AddEventHandler("crateDrop", function(roofCheck, planeSpawnDistance, dropCoords)
    CreateThread(function()

        if dropCoords.x and dropCoords.y and dropCoords.z and tonumber(dropCoords.x) and tonumber(dropCoords.y) and tonumber(dropCoords.z) then

        else
            dropCoords = {0.0, 0.0, 72.0}
        end

        if roofCheck and roofCheck ~= "false" then

            local ray = StartShapeTestRay(vector3(dropCoords.x, dropCoords.y, dropCoords.z) + vector3(0.0, 0.0, 500.0), vector3(dropCoords.x, dropCoords.y, dropCoords.z), -1, -1, 0)
            local _, hit, impactCoords = GetShapeTestResult(ray)

            if hit == 0 or (hit == 1 and #(vector3(dropCoords.x, dropCoords.y, dropCoords.z) - vector3(impactCoords)) < 10.0) then

                CrateDrop(planeSpawnDistance, dropCoords)
            else
                return
            end
        else
            CrateDrop(planeSpawnDistance, dropCoords)
        end

    end)
end)

function CrateDrop(planeSpawnDistance, dropCoords)
    Citizen.CreateThread(function()

        for i = 1, #requiredModels do
            RequestModel(GetHashKey(requiredModels[i]))
            while not HasModelLoaded(GetHashKey(requiredModels[i])) do
                Wait(0)
            end
        end

        RequestWeaponAsset(GetHashKey("weapon_flare"))
        while not HasWeaponAssetLoaded(GetHashKey("weapon_flare")) do
            Wait(0)
        end

        local rHeading = math.random(0, 360) + 0.0
        local planeSpawnDistance = (planeSpawnDistance and tonumber(planeSpawnDistance) + 0.0) or 400.0
        local theta = (rHeading / 180.0) * 3.14
        local rPlaneSpawn = vector3(dropCoords.x, dropCoords.y, dropCoords.z) - vector3(math.cos(theta) * planeSpawnDistance, math.sin(theta) * planeSpawnDistance, -500.0)

        local dx = dropCoords.x - rPlaneSpawn.x
        local dy = dropCoords.y - rPlaneSpawn.y
        local heading = GetHeadingFromVector_2d(dx, dy)

        aircraft = CreateVehicle(GetHashKey("titan"), rPlaneSpawn, heading, true, true)
        SetEntityHeading(aircraft, heading)
        SetVehicleDoorsLocked(aircraft, 2)
        SetEntityDynamic(aircraft, true)
        ActivatePhysics(aircraft)
        SetVehicleForwardSpeed(aircraft, 60.0)
        SetHeliBladesFullSpeed(aircraft)
        SetVehicleEngineOn(aircraft, true, true, false)
        ControlLandingGear(aircraft, 3)
        OpenBombBayDoors(aircraft)
        SetEntityProofs(aircraft, true, false, true, false, false, false, false, false)

        pilot = CreatePedInsideVehicle(aircraft, 1, GetHashKey("s_m_m_pilot_02"), -1, true, true)
        SetBlockingOfNonTemporaryEvents(pilot, true)
        SetPedRandomComponentVariation(pilot, false)
        SetPedKeepTask(pilot, true)
        SetPlaneMinHeightAboveTerrain(aircraft, 50)

        TaskVehicleDriveToCoord(pilot, aircraft, vector3(dropCoords.x, dropCoords.y, dropCoords.z) + vector3(0.0, 0.0, 500.0), 60.0, 0, GetHashKey("titan"), 262144, 15.0, -1.0)

        local droparea = vector2(dropCoords.x, dropCoords.y)
        local planeLocation = vector2(GetEntityCoords(aircraft).x, GetEntityCoords(aircraft).y)
        -- while not IsEntityDead(pilot) and #(planeLocation - droparea) > 5.0 do 
        --     Wait(100)
        --     planeLocation = vector2(GetEntityCoords(aircraft).x, GetEntityCoords(aircraft).y) 
        -- end

        -- if IsEntityDead(pilot) then 
        --     ESX.ShowNotification("LMAO FFA", "Pilot airdrop mati, Airdrop dibatalkan", 3700, 'info')
        --     -- do return end
        -- end

        TaskVehicleDriveToCoord(pilot, aircraft, 0.0, 0.0, 500.0, 60.0, 0, GetHashKey("titan"), 262144, -1.0, -1.0)
        SetEntityAsNoLongerNeeded(pilot)
        SetEntityAsNoLongerNeeded(aircraft)

        local crateSpawn = vector3(dropCoords.x, dropCoords.y, GetEntityCoords(aircraft).z - 5.0)

        crate = CreateObject(GetHashKey("prop_box_wood02a_pu"), crateSpawn, true, true, true)
        SetEntityLodDist(crate, 1000)
        ActivatePhysics(crate)
        SetDamping(crate, 2, 0.1)
        SetEntityVelocity(crate, 0.0, 0.0, -0.2)

        parachute = CreateObject(GetHashKey("p_cargo_chute_s"), crateSpawn, true, true, true)
        SetEntityLodDist(parachute, 1000)
        SetEntityVelocity(parachute, 0.0, 0.0, -0.2)

        soundID = GetSoundId()
        PlaySoundFromEntity(soundID, "Crate_Beeps", crate, "MP_CRATE_DROP_SOUNDS", true, 0)

        blip = AddBlipForEntity(crate)
        SetBlipSprite(blip, 478)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Airdrop")
        EndTextCommandSetBlipName(blip)
        SetBlipScale(blip, 1.2)
        SetBlipColour(blip, 1)
        SetBlipAlpha(blip, 255)

        AttachEntityToEntity(parachute, crate, 0, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

        while HasObjectBeenBroken(crate) == false do
            Wait(0)
        end

        local parachuteCoords = vector3(GetEntityCoords(parachute))
        ShootSingleBulletBetweenCoords(parachuteCoords, parachuteCoords - vector3(0.0001, 0.0001, 0.0001), 0, false, GetHashKey("weapon_flare"), 0, true, false, -1.0)
        DetachEntity(parachute, true, true)

        DeleteEntity(parachute)
        DetachEntity(crate)
        SetBlipAlpha(blip, 255)

        ESX.Game.SpawnLocalObject('ex_prop_adv_case_sm', parachuteCoords, function(obj)
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)
            table.insert(itemObj, obj)
        end)

        while getCrate do
            Wait(0)

            local playerPed = cache.ped
            local coords = GetEntityCoords(cache.ped)
            local nearbyObject, nearbyID

            for i = 1, #itemObj, 1 do
                if GetDistanceBetweenCoords(coords, GetEntityCoords(itemObj[i]), false) < 2 then
                    nearbyObject, nearbyID = itemObj[i], i
                end
            end

            if nearbyObject and IsPedOnFoot(playerPed) then

                -- ESX.ShowHelpNotification("Press ~INPUT_PICKUP~ to get Airdrop")
                lib.showTextUI('[E] - Ambil Airdrop', {
                    position = "right-center",
                    icon = 'box',
                    style = {
                        borderRadius = 0,
                        backgroundColor = '#810e0e',
                        color = 'white'
                    }
                })
                if IsControlJustPressed(1, 38) then
                    getItemInAirDrop()
                    ESX.Game.DeleteObject(nearbyObject)
                    lib.hideTextUI()
                    getCrate = false
                end
            end
        end

        while DoesObjectOfTypeExistAtCoords(parachuteCoords, 10.0, GetHashKey("w_am_flare"), true) do
            Wait(0)
            local prop = GetClosestObjectOfType(parachuteCoords, 10.0, GetHashKey("w_am_flare"), false, false, false)
            RemoveParticleFxFromEntity(prop)
            SetEntityAsMissionEntity(prop, true, true)
            DeleteObject(prop)
        end

        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end

        StopSound(soundID)
        ReleaseSoundId(soundID)

        for i = 1, #requiredModels do
            Wait(0)
            SetModelAsNoLongerNeeded(GetHashKey(requiredModels[i]))
        end

        RemoveWeaponAsset(GetHashKey("weapon_flare"))
        getCrate = true
    end)
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(10)
    end
end

RegisterCommand("airdroptest", function()
    TriggerEvent("crateDrop")
end)

function getItemInAirDrop()
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(cache.ped, "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
    TaskPlayAnim(cache.ped, "anim@gangops@facility@servers@bodysearch@", "player_search", 8.0, -8.0, -1, 48, 0, false, false, false)
    LocalPlayer.state.lagiSibuk = true
    local berhasil = lib.progressCircle({
        position = 'bottom',
        duration = 8000,
        label = 'Membuka Airdrop',
        useWhileDead = false,
        canCancel = true,
        disable = {
            car = true,
            combat = true,
            mouse = false,
            move = true
        },
        anim = {
            dict = 'mini@cpr@char_a@cpr_str',
            clip = 'cpr_pumpchest',
            flag = 3
        }
    })
    if berhasil then
        LocalPlayer.state.lagiSibuk = false
        TriggerServerEvent('addweapon:airdrop')
        ClearPedTasksImmediately(cache.ped)
        DeleteEntity(pilot)
        SetEntityAsMissionEntity(aircraft, false, true)
        DeleteEntity(aircraft)
        DeleteEntity(parachute)
        DeleteEntity(crate)
        RemovePickup(pickup)
        RemoveBlip(blip)
        StopSound(soundID)
        ReleaseSoundId(soundID)
    else
        LocalPlayer.state.lagiSibuk = false
        ClearPedTasksImmediately(cache.ped)
        ESX.ShowNotification("INFO", "Airdrop Dibatalkan!", 2000, 'error')
    end
end

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(itemObj) do
            ESX.Game.DeleteObject(v)
        end

        SetEntityAsMissionEntity(pilot, false, true)
        DeleteEntity(pilot)
        SetEntityAsMissionEntity(aircraft, false, true)
        DeleteEntity(aircraft)
        DeleteEntity(parachute)
        DeleteEntity(crate)
        RemovePickup(pickup)
        RemoveBlip(blip)
        StopSound(soundID)
        ReleaseSoundId(soundID)

        for i = 1, #requiredModels do
            Wait(0)
            SetModelAsNoLongerNeeded(GetHashKey(requiredModels[i]))
        end

    end
end)
