local bags = {}

AddEventHandler('playerDropped', function()
    local src = source
    if not dizonaaman then
        local xPlayer = ESX.GetPlayerFromId(src)
        local ped = GetPlayerPed(src)
        local pCoords = GetEntityCoords(ped)
        local randomid = GenerateId()

        if bags[randomid] == nil then
            bags[randomid] = {
                items = {},
                weapons = {},
                coords = pCoords,
                entityid = 0,
                cleaming = false
            }

            for i = 1, #xPlayer.inventory, 1 do
                if xPlayer.inventory[i].count > 0 then
                    table.insert(bags[randomid]["items"], {
                        item = xPlayer.inventory[i].name,
                        count = xPlayer.inventory[i].count
                    })
                    xPlayer.removeInventoryItem(xPlayer.inventory[i].name, xPlayer.inventory[i].count)
                end
            end

            if not Config.WeaponItems then
                for k, weapon in pairs(xPlayer.getLoadout()) do
                    local label = ESX.GetWeaponLabel(weapon.name)
                    if label then
                        table.insert(bags[randomid]["weapons"], {
                            name = weapon.name,
                            ammo = weapon.ammo,
                            label = label,
                            components = weapon.components,
                            tintIndex = weapon.tintIndex
                        })
                        xPlayer.removeWeapon(weapon.name)
                    end
                end
            end

            TriggerClientEvent('vd:dropNewBag', -1, randomid, bags[randomid])
        end
    end
end)

RegisterNetEvent('vd:claimBag', function(bagid)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if not bags[bagid].claiming then
        TriggerClientEvent('vd:deleteBag', -1, bagid)
        bags[bagid].claiming = true
        for k, v in pairs(bags[bagid].items) do
            xPlayer.addInventoryItem(v.item, v.count)
        end
        if not Config.WeaponItems then
            for k, v in pairs(bags[bagid].weapons) do
                xPlayer.addWeapon(v.name, v.ammo)
            end
        end
        bags[bagid] = nil
    end

end)

function GenerateId()
    math.randomseed(GetGameTimer())
    local random = math.random(1, 2000)
    return random
end
