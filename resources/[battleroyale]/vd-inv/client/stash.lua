RegisterNetEvent("dream-inventory:openStashInventory")
AddEventHandler(
    "dream-inventory:openStashInventory",
    function(data, stash)
        setStashInventoryData(data)
        openStashInventory(stash)
    end
)

RegisterNetEvent('dream-inventory:refreshStashInventory')
AddEventHandler('dream-inventory:refreshStashInventory', function(stash)
    refreshStashInventory(stash)
end)

function refreshStashInventory(stash)
    ESX.TriggerServerCallback(
        "fr-stash:getStashInventory",
        function(inventory)
            setStashInventoryData(inventory)
        end,
        stash
    )
end

function setStashInventoryData(data)
    items = {}

    SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    local blackMoney = data.blackMoney
    local stashItems = data.items
    local stashWeapons = data.weapons

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    for i = 1, #stashItems, 1 do
        local item = stashItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.weight = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #stashWeapons, 1 do
        local weapon = stashWeapons[i]

        if stashWeapons[i].name ~= "WEAPON_UNARMED" then
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = weapon.ammo,
                    weight = -1,
                    type = "item_weapon",
                    name = weapon.name,
                    usable = false,
                    rare = false,
                    canRemove = false
                }
            )
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openStashInventory(stash)
    --TriggerEvent('InteractSound_CL:PlayOnOne','StashOpen', 0.6)
    loadanimdict('pickup_object')
    TaskPlayAnim(PlayerPedId(),'pickup_object', 'putdown_low',5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "stash",
            stash = stash
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoStash",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            TriggerServerEvent("esx_stash:putItem", data.stash, data.item.type, data.item.name, count)
        end

        Wait(150)
        refreshStashInventory(data.stash)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromStash",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx_stash:getItem", data.stash, data.item.type, data.item.name, tonumber(data.number))
            openStashInventory(data.stash) --Apparently switches INSTANTLY to your own stash inventory when you try to drop/take items from an other one's. You can't duplicate anymore.
        end

        Wait(150)
        refreshStashInventory(data.stash)
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end
