local resName = GetCurrentResourceName()
local active = false


RegisterCommand('fixcrosshair', function()
	SendNuiMessage(json.encode({
        active = false
    }))
    SetNuiFocus(false, false)
end)

RegisterCommand('crosshair', function()
    TriggerEvent('vxd:crosshair')
end)

Citizen.CreateThread(function()
    if GetResourceKvpString(resName..":checked") == "false" then
        active = true
        -- DisableDefaultCrosshair()
    end
    Citizen.Wait(500)
    SendNuiMessage(json.encode({
        crosshair = GetResourceKvpString(resName..":crosshair"),
        checked = GetResourceKvpString(resName..":checked"),
        dimension = GetResourceKvpString(resName..":dimension")
    }))
end)

RegisterNetEvent('vxd:crosshair')
AddEventHandler('vxd:crosshair', function()
    if not IsPauseMenuActive() then
        SendNuiMessage(json.encode({
            active = true,
            crosshair = GetResourceKvpString(resName..":crosshair"),
            checked = GetResourceKvpString(resName..":checked"),
            dimension = GetResourceKvpString(resName..":dimension")
        }))
        SetNuiFocus(true, true)
        SetCursorLocation(0.1, 0.1)
    end
end)

RegisterNUICallback("disable", function()
    SendNuiMessage(json.encode({
        active = false
    }))
    SetNuiFocus(false, false)
end)

RegisterNetEvent("crosshair:active", function(active)
    SendNuiMessage(json.encode({
        active = active
    }))
end)

RegisterNUICallback("disable_dcross", function()
    active = true
    -- DisableDefaultCrosshair()
end)

RegisterNUICallback("enable_dcross", function()
    active = false
end)

RegisterNUICallback("save_data", function(data)
    SetResourceKvp(resName..":crosshair", tostring(data.crosshair))
    SetResourceKvp(resName..":checked", tostring(data.checked))
    SetResourceKvp(resName..":dimension", tostring(data.dimension))
end)