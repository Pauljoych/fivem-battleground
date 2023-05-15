RegisterServerEvent('vidigg:kasihlooting:diredzone', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local dapetID = {}
    local xD = 1
    local dapetItem = false

    for i = 1, xD do
        item = Vidi.ItemLootingRedzone[math.random(1, #Vidi.ItemLootingRedzone)]
        if math.random(1,8) >= item.bejan then
            if item.isWeapon and not dapetID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " tetapi tidak dapat membawa barang ini lagi", 3500, 'error')
                    else
                        dapetID[item.id] = true
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " .. item.name.. " di Redzone", 3500, 'success')
                        dapetItem = true
                        xPlayer.addWeapon(item.id, 48)
                    end
                else
                    dapetID[item.id] = true
                    TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " .. item.name.. " di Redzone", 3500, 'success')
                    dapetItem = true
                    xPlayer.addWeapon(item.id, 48)
                end
            elseif not dapetID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " tetapi tidak dapat membawa barang ini lagi", 3500, 'error')
                    else
                        dapetID[item.id] = true
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " di Redzone", 3500, 'success')
                        xPlayer.addInventoryItem(item.id, item.quantity)
                        dapetItem = true
                    end
                else
                    dapetID[item.id] = true
                    TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " di Redzone", 3500, 'success')
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    dapetItem = true
                end
            end
        end
    end
end)


RegisterServerEvent('vidigg:kasihlooting:diluarredzone', function()
    local source = tonumber(source)
    local item = {}
    local xPlayer = ESX.GetPlayerFromId(source)
    local dapetID = {}
    local xD = 1
    local dapetItem = false

    for i = 1, xD do
        item = Vidi.ItemLooting[math.random(1, #Vidi.ItemLooting)]
        if math.random(1, 13) >= item.bejan then
            if item.isWeapon and not dapetID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " tetapi tidak dapat membawa barang ini lagi", 3500, 'error')
                    else
                        dapetID[item.id] = true
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " .. item.name, 3500, 'success')
                        dapetItem = true
                        xPlayer.addWeapon(item.id, 48)
                    end
                else
                    dapetID[item.id] = true
                    TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " .. item.name, 3500, 'success')
                    dapetItem = true
                    xPlayer.addWeapon(item.id, 48)
                end
            elseif not dapetID[item.id] then
                if item.limit > 0 then
                    local count = xPlayer.getInventoryItem(item.id).count
                    if count >= item.limit then
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name.. " tetapi tidak dapat membawa barang ini lagi", 3500, 'error')
                    else
                        dapetID[item.id] = true
                        TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name, 3500, 'success')
                        xPlayer.addInventoryItem(item.id, item.quantity)
                        dapetItem = true
                    end
                else
                    dapetID[item.id] = true
                    TriggerClientEvent('vd-notif:Alert', source, "INFO", "Kamu menemukan " ..item.quantity.. "x " .. item.name, 3500, 'success')
                    xPlayer.addInventoryItem(item.id, item.quantity)
                    dapetItem = true
                end
            end
        end
        if i == xD and not dapetID[item.id] and not dapetItem then
            TriggerClientEvent('vd-notif:Alert', source, "INFO", "Tidak menemukan barang disini", 3500, 'error')
        end
    end
end)
