local GetIsTaskActive = GetIsTaskActive
local GetSeatPedIsTryingToEnter = GetSeatPedIsTryingToEnter
local GetPedConfigFlag = GetPedConfigFlag
local SetPedIntoVehicle = SetPedIntoVehicle
local SetVehicleCloseDoorDeferedAction = SetVehicleCloseDoorDeferedAction
local SetVehicleDoorShut = SetVehicleDoorShut

AddEventHandler('gameEventTriggered', function(name, args)
    if name == 'CEventNetworkPlayerEnteredVehicle' then

        local ped = ESX.PlayerData.ped
        local v = GetVehiclePedIsIn(ped, 0)

        for i = 1, 5 do

            if (not GetPedConfigFlag(ped, 184, 1)) then
                SetPedConfigFlag(ped, 184, true)
            end

            if (GetIsTaskActive(ped, 165)) then
                if (GetSeatPedIsTryingToEnter(ped) == -1) then

                    if (GetPedConfigFlag(ped, 184, 1)) then
                        SetPedIntoVehicle(ped, v, 0)
                        SetVehicleCloseDoorDeferedAction(v, 0)
                        SetVehicleDoorShut(v, 1, false)
                    end
                end
            end

            Wait(400)

        end
    end
end)

RegisterCommand('shuff', function()
    local ped = ESX.PlayerData.ped
    local veh = GetVehiclePedIsIn(ped, false)
    local IsPedInAnyVehicle = IsPedInAnyVehicle(ped, false)

    Wait(100)

    if IsPedInAnyVehicle then
        SetPedConfigFlag(ped, 184, true)
        TaskShuffleToNextVehicleSeat(ped, veh)
        SetPedConfigFlag(ped, 184, true)
    end

end, false)