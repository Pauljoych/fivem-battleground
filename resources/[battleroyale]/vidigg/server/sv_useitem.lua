local playersHealing = {}

-- // remove item \\ -- 
RegisterServerEvent('vidigg:server:removeClip')
AddEventHandler('vidigg:server:removeClip', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('clip', 1)
end)

RegisterServerEvent('vidigg:server:removeRepairKit')
AddEventHandler('vidigg:server:removeRepairKit', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('repairkit', 1)
end)

RegisterServerEvent('vidigg:server:removeArmor')
AddEventHandler('vidigg:server:removeArmor', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('armor', 1)
end)

RegisterServerEvent('vidigg:server:removeArmor2')
AddEventHandler('vidigg:server:removeArmor2', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('armor2', 1)
end)

RegisterServerEvent('vidigg:server:removeArmor3')
AddEventHandler('vidigg:server:removeArmor3', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('armor3', 1)
end)

RegisterServerEvent('vidigg:server:removeBandage')
AddEventHandler('vidigg:server:removeBandage', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('bandage', 1)
end)

RegisterServerEvent('vidigg:server:removeMedikit')
AddEventHandler('vidigg:server:removeMedikit', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('medikit', 1)
end)

RegisterServerEvent('vidigg:server:removePainkiller')
AddEventHandler('vidigg:server:removePainkiller', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('painkiller', 1)
end)

RegisterServerEvent('vidigg:server:removeEnergydrink')
AddEventHandler('vidigg:server:removeEnergydrink', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('energydrink', 1)
end)

-- // USE ITEM \\ -- 
ESX.RegisterUsableItem('medikit', function(source)
    if not playersHealing[source] then
        local xPlayer = ESX.GetPlayerFromId(source)
        -- xPlayer.removeInventoryItem('medikit', 1)

        playersHealing[source] = true
        TriggerClientEvent('esx_ambulancejob:useItem', source, 'medikit')

        Citizen.Wait(0)
        playersHealing[source] = nil
    end
end)

ESX.RegisterUsableItem('bandage', function(source)
    if not playersHealing[source] then
        local xPlayer = ESX.GetPlayerFromId(source)
        -- xPlayer.removeInventoryItem('bandage', 1)

        playersHealing[source] = true
        TriggerClientEvent('esx_ambulancejob:useItem', source, 'bandage')

        Citizen.Wait(0)
        playersHealing[source] = nil
    end
end)

ESX.RegisterUsableItem('repairkit', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:repairkit', source)
end)

ESX.RegisterUsableItem('clip', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:clipclip', source)
end)

ESX.RegisterUsableItem('armor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:armor', source)
    -- xPlayer.removeInventoryItem('armor', 1)
end)

ESX.RegisterUsableItem('armor2', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:armor2', source)
    -- xPlayer.removeInventoryItem('armor2', 1)
end)

-- ESX.RegisterUsableItem('armor3', function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)
-- 	TriggerClientEvent('vxd-item:armor3', source)
-- 	-- xPlayer.removeInventoryItem('armor3', 1)
-- end)

ESX.RegisterUsableItem('airdrop', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:airdrop', source)
    xPlayer.removeInventoryItem('airdrop', 1)
end)

ESX.RegisterUsableItem('painkiller', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:painkiller', source)
    -- xPlayer.removeInventoryItem('painkiller', 1)
end)

ESX.RegisterUsableItem('energydrink', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vxd-item:energydrink', source)
    -- xPlayer.removeInventoryItem('energydrink', 1)
end)
-- Helm Level 1 
ESX.RegisterUsableItem('helm1', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vidiganteng:helmlevel1', source)
end)

-- Helm Level 2 
ESX.RegisterUsableItem('helm2', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vidiganteng:helmlevel2', source)
end)

-- Helm Level 3
ESX.RegisterUsableItem('helm3', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('vidiganteng:helmlevel3', source)
end)
