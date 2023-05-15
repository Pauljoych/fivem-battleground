local lastStorage = nil
-- local namaku = 'TheIrham Server'

RegisterNetEvent("dream-inventory:openStorageInventory")
AddEventHandler("dream-inventory:openStorageInventory",function(storage, namabrankas)
    lastStorage = storage
    ESX.TriggerServerCallback(
        "dream-inventory:getStorageInventory",
        function(storageData)
            setStorageInventoryData(storageData, namabrankas)
            ESX.TriggerServerCallback('roy:getNamaIC', function(namaic)
                openStorageInventory(namabrankas, namaic)
                -- namaku = namaic     
            end)
            
        end,storage)
    end)
    

function refreshStorageInventory()
    -- local namabrankasku = ''
    for k,v in ipairs(Config.Brankas) do
        if lastStorage == 'society_'..v.namajob then
            ESX.TriggerServerCallback("dream-inventory:getStorageInventory",function(storageData)
                setStorageInventoryData(storageData, v.namabrankas)
            end,lastStorage)
        end
    end
    
    -- print(lastStorage)
end

function setStorageInventoryData(data, namabrankas)
    local maxBrankas

    
    -- print(namabrankas)
    items = {}

    local blackMoney = data.blackMoney
    local storageItems = data.inventory
    local storageWeapons = data.weapons

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #storageItems, 1 do
        local item = storageItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #storageWeapons, 1 do
        local weapon = storageWeapons[i]

        if storageWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    limit = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end
    for k,v in ipairs(Config.Brankas) do
        if namabrankas == v.namabrankas then
            maxBrankas = v.maxBerat
        end
    end
    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items,
            text = namabrankas,
            hitung = data.hitung,
            max = maxBrankas

        }
    )
    
end



function openStorageInventory(namabrankas, namaku)
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "storage",
            nama = namaku,
            namabrank = namabrankas
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoStorage",
    function(data, cb)

        ESX.TriggerServerCallback('roy:getNamaIC', function(namaic)
        

        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        if data.number ~= nil then
            if type(data.number) == "number" and math.floor(data.number) == data.number then
                local count = tonumber(data.number)

                if data.item.type == "item_weapon" then
                    count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
                end

                TriggerServerEvent("dream-inventory:putStorageItem", lastStorage, data.item.type, data.item.name, count)
                TriggerServerEvent('fivemid:masukLog', 'brankas', lastStorage, data.item.label, count, namaic, 'menyimpan', 'ke dalam')
                n('Menyimpan '..count..'x '..data.item.label)
                -- print(namaku..' menyimpan '..count..'x '..data.item.label..' ke dalam '..lastStorage)
        
            end
        else
            ne('Masukkan Jumlahnya!')
        end

        Wait(150)
        refreshStorageInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
        end)
    end
)

RegisterNUICallback(
    "TakeFromStorage",
    function(data, cb)
        local aa = ''
        ESX.TriggerServerCallback('roy:getNamaIC', function(namaic)
              
        
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
        if data.number ~= nil then
            -- print(data.item.type)
            if data.item.type == 'item_standard' then
                if type(data.number) == "number" and math.floor(data.number) == data.number  then
                    ESX.TriggerServerCallback('fivemid:ceklimit', function(bisa)
                        if bisa then
                            TriggerServerEvent("dream-inventory:getStorageItem", lastStorage, data.item.type, data.item.name, tonumber(data.number))
                            TriggerServerEvent('fivemid:masukLog', lastStorage, data.item.label, tonumber(data.number), namaic, 'mengambil', 'dari dalam')
                            n('Mengambil '..data.number..'x '..data.item.label)
                        else
                            ne('Ruang Tas kamu tidak cukup!')
                        end
                    end, data.item.name, data.number)
                end
            else
                TriggerServerEvent("dream-inventory:getStorageItem", lastStorage, data.item.type, data.item.name, tonumber(data.number))
                TriggerServerEvent('fivemid:masukLog', lastStorage, data.item.label, tonumber(data.number), namaic, 'mengambil', 'dari dalam')
                n('Mengambil '..data.number..'x '..data.item.label)
            end
        else
            ne('Masukkan Jumlahnya!')
        end

        Wait(150)
        refreshStorageInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
        end)
    end
)