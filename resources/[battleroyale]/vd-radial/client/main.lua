ESX = exports["vd_core"]:getSharedObject()

local inRadialMenu = false
local IsDown = false

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(xPlayer) ESX.PlayerData = xPlayer end)

RegisterNetEvent("esx:setJob")
AddEventHandler("esx:setJob", function(job) ESX.PlayerData.job = job end)

RegisterNetEvent('esx_ambulancejob:revive', function(pw)
    IsDown = false
end)

RegisterCommand('radialmenu', function()
    if not IsPauseMenuActive() and not inRadialMenu then
        openRadial(true)
        SetCursorLocation(0.5, 0.5)
    end
end)

RegisterCommand('fixradial', function()
    closeRadial(false)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
end)

RegisterKeyMapping('radialmenu', 'Open Radial Menu', 'keyboard', 'F1')

local function IsPolice()
    return (ESX.PlayerData.job.name == "police" or ESX.PlayerData.job.name == "sheriff")
end

AddEventHandler('esx:onPlayerDeath', function(reason)
	IsDown = true
end)

local ofcDownAdded = false

function setupSubItems()



    if (IsDown and IsPolice()) then
        if not ofcDownAdded then
            temptable = {
                id = 'officerdown',
                title = '10-999',
                icon = 'sad-cry',
                type = 'client',
                event = 'pb-police:ofcdown',
                shouldClose = true,
            }
            table.insert(Config.MenuItems, temptable)
            ofcDownAdded = true
        end
        -- print('ofc down')
    else
        if ofcDownAdded then
            for k,v in pairs(Config.MDrawScaleformMovieFullscreenenuItems) do
                if v.id == 'officerdown' then
                    table.remove(Config.MenuItems, k)
                    ofcDownAdded = false
                    break
                end
            end
        end
        -- print('not down or police')
    end
end

function openRadial(bool)    
    setupSubItems()

    SetNuiFocus(bool, bool)
    SendNUIMessage({
        action = "ui",
        radial = bool,
        items = Config.MenuItems
    })
    inRadialMenu = bool
end

function closeRadial(bool)    
    SetNuiFocus(false, false)
    inRadialMenu = bool
end

RegisterNUICallback('closeRadial', function()
    closeRadial(false)
end)

RegisterNUICallback('selectItem', function(data)
    local itemData = data.itemData

    if itemData.type == 'client' then
        TriggerEvent(itemData.event, itemData)
    elseif itemData.type == 'server' then
        TriggerServerEvent(itemData.event, itemData)
    elseif itemData.type == 'cmd' then
        ExecuteCommand(itemData.event)
    end
end)

