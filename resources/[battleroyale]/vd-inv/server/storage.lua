ESX = exports["vd_core"]:getSharedObject()

ESX.RegisterServerCallback(
    "dream-inventory:getStorageInventory",
    function(source, cb, storage)
        local targetXPlayer = ESX.GetPlayerFromId(target)
        local weapons, items, blackMoney

        TriggerEvent(
            "esx_datastore:getSharedDataStore",
            storage,
            function(store)
                weapons = store.get("weapons")

                if weapons == nil then
                    weapons = {}
                end

                TriggerEvent(
                    "esx_addoninventory:getSharedInventory",
                    storage,
                    function(inventory)
                        items = inventory.items

                        if items == nil then
                            items = {}
                            
                        end

                        TriggerEvent(
                            "esx_addonaccount:getSharedAccount", storage .. "_black_money",function(account)
                                if account ~= nil then
                                    blackMoney = account.money
                                else
                                    blackMoney = 0
                                end

                                
                                local hitung = 0
                                for i=1, #items do
                                    hitung = hitung + items[i].count
                                end
                                -- print(hitung)
                                cb({inventory = items, blackMoney = blackMoney, weapons = weapons, hitung = hitung})
                            end
                        )
                    end
                )
            end
        )
    end
)

RegisterServerEvent("dream-inventory:getStorageItem")
AddEventHandler(
    "dream-inventory:getStorageItem",
    function(storage, type, item, count)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        if type == "item_standard" then
            local sourceItem = xPlayer.getInventoryItem(item)

            TriggerEvent(
                "esx_addoninventory:getSharedInventory",
                storage,
                function(inventory)
                    local inventoryItem = inventory.getItem(item)

                    -- is there enough in the property?
                    if count > 0 and inventoryItem.count >= count then
                        -- can the player carry the said amount of x item?
                            inventory.removeItem(item, count)
                            xPlayer.addInventoryItem(item, count)

                            TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "TAKE", inventoryItem.label, count, inventoryItem.count - count)
                            TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "success", text = "Kamu mengambil "..count.."x "..inventoryItem.label})
                    else
                        TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
                    end
                end
            )
        elseif type == "item_account" then
            TriggerEvent(
                "esx_addonaccount:getSharedAccount",
                storage .. "_black_money",
                function(account)
                    local roomAccountMoney = account.money

                    if roomAccountMoney >= count then
                        account.removeMoney(count)
                        xPlayer.addAccountMoney(item, count)

                        TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "TAKE", "Špinavé prachy", count, roomAccountMoney)
                    else
                        TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
                    end
                end
            )
        elseif type == "item_weapon" then
            TriggerEvent(
                "esx_datastore:getSharedDataStore",
                storage,
                function(store)
                    local storeWeapons = store.get("weapons") or {}
                    local weaponName = nil
                    local ammo = nil
                    local components = {}

                    for i = 1, #storeWeapons, 1 do
                        if storeWeapons[i].name == item then
                            weaponName = storeWeapons[i].name
                            ammo = storeWeapons[i].ammo

                            if storeWeapons[i].components ~= nil then
                                components = storeWeapons[i].components
                            end

                            table.remove(storeWeapons, i)
                            break
                        end
                    end

                    store.set("weapons", storeWeapons)
                    xPlayer.addWeapon(weaponName, ammo)
                    TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "success", text = "Kamu mengambil "..weaponName})
                    TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "TAKE", weaponName, ammo, 0)

                    for i = 1, #components do
                        xPlayer.addWeaponComponent(weaponName, components[i])
                    end
                end
            )
        end
    end
)

RegisterServerEvent("dream-inventory:putStorageItem")
AddEventHandler(
    "dream-inventory:putStorageItem",
    function(storage, type, item, count)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        if type == "item_standard" then
            local playerItemCount = xPlayer.getInventoryItem(item).count

            if playerItemCount >= count and count > 0 then
                TriggerEvent(
                    "esx_addoninventory:getSharedInventory",
                    storage,
                    function(inventory)
                        xPlayer.removeInventoryItem(item, count)
                        inventory.addItem(item, count)

                        local inventoryItem = inventory.getItem(item)
                        TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", inventoryItem.label, count, inventoryItem.count)
                    end
                )
            else
                TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            end
        elseif type == "item_account" then
            local playerAccountMoney = xPlayer.getAccount(item).money

            if playerAccountMoney >= count and count > 0 then
                xPlayer.removeAccountMoney(item, count)
                print(account)

                TriggerEvent(
                    "esx_addonaccount:getSharedAccount",
                    storage .. "_black_money",
                    function(account)
                        account.addMoney(count)
                        TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", "Špinavé prachy", count, account.money + count)
                    end
                )
            else
                TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            end
        elseif type == "item_weapon" then
            TriggerEvent(
                "esx_datastore:getSharedDataStore",
                storage,
                function(store)
                    local storeWeapons = store.get("weapons") or {}

                    local pos, playerWeapon = xPlayer.getWeapon(item)
                    local components = playerWeapon.components
                    if components == nil then
                        components = {}
                    end

                    table.insert(
                        storeWeapons,
                        {
                            name = item,
                            ammo = count,
                            components = components
                        }
                    )

                    TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", item, count, count)

                    store.set("weapons", storeWeapons)
                    xPlayer.removeWeapon(item)
                end
            )
        end
    end
)

RegisterServerEvent("dream-inventory:addStorageItem")
AddEventHandler(
    "dream-inventory:addStorageItem",
    function(storage, type, item, count)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        if type == "item_standard" then
            local playerItemCount = xPlayer.getInventoryItem(item).count

            -- if playerItemCount >= count and count > 0 then
                TriggerEvent(
                    "esx_addoninventory:getSharedInventory",
                    storage,
                    function(inventory)
                        -- xPlayer.removeInventoryItem(item, count)
                        if inventory.getItem(item).count ~= count then
                            inventory.addItem(item, count)
                            print(item, count)
                        end

                        -- local inventoryItem = inventory.getItem(item)
                        -- TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", inventoryItem.label, count, inventoryItem.count)
                    end
                )
            -- else
            --     TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            -- end
        elseif type == "item_account" then
            local playerAccountMoney = xPlayer.getAccount(item).money

            if playerAccountMoney >= count and count > 0 then
                xPlayer.removeAccountMoney(item, count)
                print(account)

                TriggerEvent(
                    "esx_addonaccount:getSharedAccount",
                    storage .. "_black_money",
                    function(account)
                        account.addMoney(count)
                        TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", "Špinavé prachy", count, account.money + count)
                    end
                )
            else
                TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            end
        elseif type == "item_weapon" then
            TriggerEvent(
                "esx_datastore:getSharedDataStore",
                storage,
                function(store)
                    local storeWeapons = store.get("weapons") or {}

                    local pos, playerWeapon = xPlayer.getWeapon(item)
                    local components = playerWeapon.components
                    if components == nil then
                        components = {}
                    end

                    table.insert(
                        storeWeapons,
                        {
                            name = item,
                            ammo = count,
                            components = components
                        }
                    )

                    TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", item, count, count)

                    store.set("weapons", storeWeapons)
                    xPlayer.removeWeapon(item)
                end
            )
        end
    end
)

RegisterServerEvent("dream-inventory:delStorageItem")
AddEventHandler(
    "dream-inventory:delStorageItem",
    function(storage, type, item, count)
        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)

        if type == "item_standard" then
            local playerItemCount = xPlayer.getInventoryItem(item).count

            -- if playerItemCount >= count and count > 0 then
                TriggerEvent(
                    "esx_addoninventory:getSharedInventory",
                    storage,
                    function(inventory)
                        -- xPlayer.removeInventoryItem(item, count)
                        -- if inventory.getItem(item).count ~= count then
                            inventory.removeItem(item, count)
                        --     print(item, count)
                        -- end

                        -- local inventoryItem = inventory.getItem(item)
                        -- TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", inventoryItem.label, count, inventoryItem.count)
                    end
                )
            -- else
            --     TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            -- end
        elseif type == "item_account" then
            local playerAccountMoney = xPlayer.getAccount(item).money

            if playerAccountMoney >= count and count > 0 then
                xPlayer.removeAccountMoney(item, count)
                print(account)

                TriggerEvent(
                    "esx_addonaccount:getSharedAccount",
                    storage .. "_black_money",
                    function(account)
                        account.addMoney(count)
                        TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", "Špinavé prachy", count, account.money + count)
                    end
                )
            else
                TriggerClientEvent("mythic_notify:client:SendAlert", source, { type = "error", text = "Jumlah item salah"})
            end
        elseif type == "item_weapon" then
            TriggerEvent(
                "esx_datastore:getSharedDataStore",
                storage,
                function(store)
                    local storeWeapons = store.get("weapons") or {}

                    local pos, playerWeapon = xPlayer.getWeapon(item)
                    local components = playerWeapon.components
                    if components == nil then
                        components = {}
                    end

                    table.insert(
                        storeWeapons,
                        {
                            name = item,
                            ammo = count,
                            components = components
                        }
                    )

                    TriggerEvent("esx_adminmenu:logSociety", storage, GetPlayerIdentifiers(_source), xPlayer, "PUT", item, count, count)

                    store.set("weapons", storeWeapons)
                    xPlayer.removeWeapon(item)
                end
            )
        end
    end
)

RegisterServerEvent('dream-inventory:clearStorage')
AddEventHandler('dream-inventory:clearStorage', function(a)
    Items = {}
    local InventoriesIndex, Inventories, SharedInventories = {}, {}, {}
    MySQL.Sync.execute("delete from addon_inventory_items where inventory_name = '"..a.."'")
    print(a)
  
end)