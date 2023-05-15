isInInventory = false

local fastWeapons = {
    [1] = nil,
    [2] = nil,
    [3] = nil,
    [4] = nil,
    [5] = nil
}
local spawnedPeds = {}
local AnimTrunk = false
local fastItemsHotbar = {}
local itemslist ={}
local isHotbar = false


RegisterNetEvent('fivemid-notif:kasihNotif')
AddEventHandler('fivemid-notif:kasihNotif', function(a,b)
    if a then
        n(b)
    else
        ne(b)
    end
end)

RegisterCommand('invhtbar', function(source, args)
    if not IsEntityDead(cache.ped, true) then
	    TriggerEvent('vxd-inventory:invhtbar', args[1])
    end
end)

local abcaa = false

RegisterNetEvent('vxd-inventory:invhtbar')
AddEventHandler('vxd-inventory:invhtbar', function(type)
    if type == '1' then
        if fastWeapons[1] ~= nil then
            if string.find(fastWeapons[1],"WEAPON_") then
                weaponLabel = ESX.GetWeaponLabel(fastWeapons[1])
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[1]) then
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    TriggerEvent('dream-inventory:notification', "Disimpan", fastWeapons[1], weaponLabel, 1, false)
                else
                    TriggerEvent('dream-inventory:notification', "Digunakan", fastWeapons[1], weaponLabel, 1, false)
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED", true)
                    Citizen.Wait(500)
                    SetCurrentPedWeapon(PlayerPedId(), fastWeapons[1], true)
                end
            else
                if not abcaa then
                    abcaa = true
                    TriggerServerEvent("esx:useItem", fastWeapons[1])
                    Citizen.Wait(250)
                    abcaa = false
                    loadPlayerInventory()
                end
            end
        end
    elseif type == '2' then
        if fastWeapons[2] ~= nil then
            if string.find(fastWeapons[2],"WEAPON_") then
                weaponLabel = ESX.GetWeaponLabel(fastWeapons[2])
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[2]) then
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    TriggerEvent('dream-inventory:notification', "Disimpan", fastWeapons[2], weaponLabel, 1, false)
                else
                    TriggerEvent('dream-inventory:notification', "Digunakan", fastWeapons[2], weaponLabel, 1, false)
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    Citizen.Wait(500)
                    SetCurrentPedWeapon(PlayerPedId(), fastWeapons[2],true)
                end
            else
                if not abcaa then
                    abcaa = true
                    TriggerServerEvent("esx:useItem", fastWeapons[2])
                    Citizen.Wait(250)
                    abcaa = false
                    loadPlayerInventory()
                end
            end
        end
    elseif type == '3' then
        if fastWeapons[3] ~= nil then
            if string.find(fastWeapons[3],"WEAPON_") then
                weaponLabel = ESX.GetWeaponLabel(fastWeapons[3])
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[3]) then
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    TriggerEvent('dream-inventory:notification', "Disimpan", fastWeapons[3], weaponLabel, 1, false)
                else
                    TriggerEvent('dream-inventory:notification', "Digunakan", fastWeapons[3], weaponLabel, 1, false)
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    Citizen.Wait(500)
                    SetCurrentPedWeapon(PlayerPedId(), fastWeapons[3],true)
                end
            else
                if not abcaa then
                    abcaa = true
                    TriggerServerEvent("esx:useItem", fastWeapons[3])
                    Citizen.Wait(250)
                    abcaa = false
                    loadPlayerInventory()
                end
            end
        end
    elseif type == '4' then
        if fastWeapons[4] ~= nil then
            if string.find(fastWeapons[4],"WEAPON_") then
                weaponLabel = ESX.GetWeaponLabel(fastWeapons[4])
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[4]) then
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    TriggerEvent('dream-inventory:notification', "Disimpan", fastWeapons[4], weaponLabel, 1, false)
                else
                    TriggerEvent('dream-inventory:notification', "Digunakan", fastWeapons[4], weaponLabel, 1, false)
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    Citizen.Wait(500)
                    SetCurrentPedWeapon(PlayerPedId(), fastWeapons[4],true)
                end
            else
                if not abcaa then
                    abcaa = true
                    TriggerServerEvent("esx:useItem", fastWeapons[4])
                    Citizen.Wait(250)
                    abcaa = false
                    loadPlayerInventory()
                end
            end
        end
    elseif type == '5' then
        if fastWeapons[5] ~= nil then
            if string.find(fastWeapons[5],"WEAPON_") then
                weaponLabel = ESX.GetWeaponLabel(fastWeapons[5])
                if GetSelectedPedWeapon(PlayerPedId()) == GetHashKey(fastWeapons[5]) then
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    TriggerEvent('dream-inventory:notification', "Disimpan", fastWeapons[5], weaponLabel, 1, false)
                else
                    TriggerEvent('dream-inventory:notification', "Digunakan", fastWeapons[5], weaponLabel, 1, false)
                    SetCurrentPedWeapon(PlayerPedId(), "WEAPON_UNARMED",true)
                    Citizen.Wait(500)
                    SetCurrentPedWeapon(PlayerPedId(), fastWeapons[5],true)
                end
            else
                if not abcaa then
                    abcaa = true
                    TriggerServerEvent("esx:useItem", fastWeapons[5])
                    Citizen.Wait(250)
                    abcaa = false
                    loadPlayerInventory()
                end
            end
        end
    end
end)




RegisterCommand('showhotbar', function()
    showHotbar()
    loadPlayerInventory()
end)

RegisterNetEvent('vxd-inventory:openinv1')
AddEventHandler('vxd-inventory:openinv1', function()
    openInventory()
    loadPlayerInventory()
end)

RegisterCommand('bukatas', function()
    openInventory()
    loadPlayerInventory()
end)

-- RegisterKeyMapping('bukatas', 'Akses Tas', 'keyboard', 'F2')

function playAnim(animDict, animName, duration)
	RequestAnimDict(animDict)
	while not HasAnimDictLoaded(animDict) do Citizen.Wait(0) end
	TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
	RemoveAnimDict(animDict)
end



function loadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end

function openHouseAnim()
    --loadAnimDict("anim@heists@keycard@")
    --TaskPlayAnim( PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Citizen.Wait(400)
    ClearPedTasks(PlayerPedId())
end

function isOpenInventory()
    return isInInventory
end

function openInventory()
    if not IsPlayerDead(PlayerId()) then
        local playerPed = PlayerPedId()
        -- local namaku = ''
        -- ESX.TriggerServerCallback('roy:getNamaIC', function(namaic)
        --     namaku = namaic     
        -- end)
        -- ESX.TriggerServerCallback('GetCharacterNameServer', function(nama)
        --     namaku = nama
        -- end)
        loadAnimDict('pickup_object')
        playAnim('pickup_object', 'putdown_low', 1350)
        Wait(500)
        ClearPedSecondaryTask(playerPed)
        loadPlayerInventory()
        isInInventory = true
        local vidi = GetPlayerName(PlayerPedId())
        SendNUIMessage(
            {
                action = "display",
                type = "normal",
                nama = GetPlayerName(PlayerId()).." [ID "..GetPlayerServerId(PlayerId()).."]"
            }
        )
        SetNuiFocus(true, true)
    else
        -- ne('Kamu sedang pingsan, tidak mampu untuk membuka tas!')
        ESX.ShowNotification("INFO", "Kamu sedang pingsan, tidak mampu untuk membuka tas", 2500, 'error')
    end
end

RegisterNetEvent("dream-inventory:doClose")
AddEventHandler("dream-inventory:doClose", function()
    closeInventory()
end)

RegisterCommand('closeinventory', function(source, args, raw)
    closeInventory()
end)

function closeInventory()
    if AnimTrunk then
        AnimTrunk = false
        ClearPedTasksImmediately(PlayerPedId())
        ClearPedTasks(PlayerPedId())
    end
    -- if GetTimecycleModifierIndex() ~= 145 then
    --     SetTimecycleModifier('default')
    -- end
    local playerPed = PlayerPedId()
    if IsEntityPlayingAnim(playerPed, 'mp_missheist_countrybank@nervous', 'nervous_idle', 3) then
        ClearPedTasks(playerPed)
    end
    isInInventory = false
    SendNUIMessage(
        {
            action = "hide"
        }
    )
    SetNuiFocus(false, false)
end

-- RegisterNetEvent("dream-inventory:AnimTrunk")
-- AddEventHandler("dream-inventory:AnimTrunk" , function(data)
--     AnimTrunk = true
--     if AnimTrunk then

--         local lib, anim = 'mini@repair', 'fixing_a_ped'
--         while AnimTrunk do
--             ESX.Streaming.RequestAnimDict(lib, function()
--                 TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
--             end)
--             Citizen.Wait(3000)
--         end

--     end
-- end)

RegisterNetEvent('dream-inventory:notification')
AddEventHandler('dream-inventory:notification', function(sourceitemaction, sourceitemname, sourceitemlabel, sourceitemcount, sourceitemremove)
    SendNUIMessage({
        action      = "notification",
        itemaction  = sourceitemaction,
        itemname    = sourceitemname,
        itemlabel   = sourceitemlabel,
        itemcount   = sourceitemcount,
        itemremove  = sourceitemremove
    })
end)

RegisterNUICallback(
    "NUIFocusOff",
    function()
        closeInventory()
    end
)

function isWeapon(name)
    local oke = nil

    if string.find(name, 'WEAPON_') then
        oke = true

    elseif string.find(name, 'GADGET_') then
        oke = true

    else
        oke = false
    end

    return oke
end

RegisterNUICallback(
    "GetNearPlayers",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayers = false
        local elements = {}

        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                foundPlayers = true

                table.insert(
                    elements,
                        {
                            label = "No ID : ",
                            player = GetPlayerServerId(players[i])
                        }
                    )
            end
        end

        if not foundPlayers then
            -- exports['tir_notify']:SendAlert('inform', _U("players_nearby"))
            ne(_U("players_nearby"))
        else
            SendNUIMessage(
                {
                    action = "nearPlayers",
                    foundAny = foundPlayers,
                    players = elements,
                    item = data.item
                }
            )
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "UseItem",
    function(data, cb)
        TriggerServerEvent("esx:useItem", data.item.name)

        if shouldCloseInventory(data.item.name) then
            closeInventory()
        else
            Citizen.Wait(250)
            loadPlayerInventory()
            closeInventory()
        end

        cb("ok")
    end
)

RegisterNUICallback(
    "DropItem",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
			if data.item.type == "item_money" then
				TriggerServerEvent("esx:removeInventoryItem", "item_account", "money", data.number)
            else
				TriggerServerEvent("esx:removeInventoryItem", data.item.type, data.item.name, data.number)
			end
        end

        TaskPlayAnim(playerPed, 'random@domestic', 'pickup_low', 8.0, -8, -1, 48, 0, 0, 0, 0)
        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "GiveItem",
    function(data, cb)
        local playerPed = PlayerPedId()
        local players, nearbyPlayer = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
        local foundPlayer = false
        for i = 1, #players, 1 do
            if players[i] ~= PlayerId() then
                if GetPlayerServerId(players[i]) == data.player then
                    foundPlayer = true
                end
            end
        end

        if foundPlayer then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

			TriggerServerEvent("esx:giveInventoryItem", data.player, data.item.type, data.item.name, count)

            playAnim('mp_common', 'givetake1_a', 2500)
            closeInventory()
            local target, distance = ESX.Game.GetClosestPlayer()
					        playerheading = GetEntityHeading(PlayerPedId())
					        playerlocation = GetEntityForwardVector(PlayerPedId())
					        playerCoords = GetEntityCoords(PlayerPedId())
					        local target_id = GetPlayerServerId(target)
							if distance <= 2.0 then
								TriggerServerEvent('dream-inventory:doClose', target_id)
                            end
            Wait(250)
            loadPlayerInventory()
        else
            -- exports['mythic_notify']:DoHudText('error', 'No one nearby!')
            -- ne('Tidak ada orang disekitarmu!')
            print("ra ono uwong")
        end
        cb("ok")
    end
)

function shouldCloseInventory(itemName)
    for index, value in ipairs(Config.CloseUiItems) do
        if value == itemName then
            return true
        end
    end

    return false
end

function shouldSkipAccount(accountName)
    for index, value in ipairs(Config.ExcludeAccountsList) do
        if value == accountName then
            return true
        end
    end

    return false
end

function loadPlayerInventory()
    ESX.TriggerServerCallback("dream-inventory:getPlayerInventory", function(data)
            items = {}
            fastItems = {}
            inventory = data.inventory
            accounts = data.accounts
            money = data.money
            weapons = data.weapons

            if Config.IncludeCash and money ~= nil and money > 0 then
                --for key, value in pairs(accounts) do
                     moneyData = {
                         label = _U("cash"),
                         name = "cash",
                         type = "item_money",
                         count = money,
                         usable = false,
                         rare = false,
                         limit = -1,
                         canRemove = true
                     }
 
                     table.insert(items, moneyData)
                -- end
            end

            if Config.IncludeAccounts and accounts ~= nil then
                for key, value in pairs(accounts) do
                    if not shouldSkipAccount(accounts[key].name) then
                        local canDrop = accounts[key].name ~= "bank"

                        if accounts[key].money > 0 then
                            accountData = {
                                label = accounts[key].label,
                                count = accounts[key].money,
                                type = "item_account",
                                name = accounts[key].name,
                                usable = false,
                                rare = false,
                                limit = -1,
                                canRemove = canDrop
                            }
                            table.insert(items, accountData)
                        end
                    end
                end
            end

            if inventory ~= nil then

                for key, value in pairs(inventory) do
                    local fnd = false
                    for slot, inv in pairs(fastWeapons) do
                        if inv == inventory[key].name and inventory[key].count > 0 then
                            inventory[key].type = "item_standard"
                            inventory[key].slot = slot
                            table.insert(fastItems, inventory[key])
                            fnd = true
                            break
                        end
                    end
                    if fnd == false then
                        if inventory[key].count <= 0 then
                            inventory[key] = nil
                        else
                            inventory[key].type = "item_standard"
                            table.insert(items, inventory[key])
                        end
                    end
                end
            end

            if Config.IncludeWeapons and weapons ~= nil then
                for key, value in pairs(weapons) do
                    local weaponHash = GetHashKey(weapons[key].name)
                    local playerPed = PlayerPedId()
                    if HasPedGotWeapon(playerPed, weaponHash, false) and weapons[key].name ~= "WEAPON_UNARMED" then
                            local found = false
                            for slot, weapon in pairs(fastWeapons) do
                                if weapon == weapons[key].name then
                                    local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                    table.insert(
                                        fastItems,
                                        {
                                            label = weapons[key].label,
                                            count = ammo,
                                            limit = -1,
                                            type = "item_weapon",
                                            name = weapons[key].name,
                                            usable = false,
                                            rare = false,
                                            canRemove = true,
                                            slot = slot
                                        }
                                    )
                                    found = true
                                    break
                                end
                            end
                            if found == false then
                                local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
                                table.insert(
                                    items,
                                    {
                                        label = weapons[key].label,
                                        count = ammo,
                                        limit = -1,
                                        type = "item_weapon",
                                        name = weapons[key].name,
                                        usable = false,
                                        rare = false,
                                        canRemove = true
                                    }
                                )
                            end
                    end
                end
            end

            fastItemsHotbar =  fastItems
            SendNUIMessage(
            {
                action = "setItems",
                itemList = items,
                fastItems = fastItems,
                text = texts
            })
            ESX.TriggerServerCallback("dream-inventory:getPlayerInventoryWeight", function(cb, a)
                if Config.PakaiESX == 'lama' then
                    local arrayWeight = Config.localWeight
                    local weight = 0
                    local itemWeight = 0
                    local itemsW = 0
                    if items ~= nil then
                    for i = 1, #items, 1 do
                        if items[i] ~= nil then
                        itemWeight = Config.DefaultWeight
                        itemWeight = itemWeight / items[1].count * 0.0
                        if arrayWeight[items[i].name] ~= nil then
                        itemWeight = arrayWeight[items[i].name]
                        items[i].limit = itemWeight / 100
                        end
                        weight = weight + (itemWeight * (items[i].count or 1))
                        end
                    end
                    end
                    
                    if weight > Config.Limit then
                        TriggerEvent("DoShortHudText","Inventory Full, can't walk")
                        setHurt()
                    elseif weight <= Config.Limit then
                    setNotHurt()
                    end

                    SendNUIMessage(
                    {
                        action = "setInfoPlayer",
                        playerWeight = weight,
                        maxweight = Config.Limit
                    })
                elseif Config.PakaiESX == 'baru' then
                    -- -- if tonumber(cb) > Config.MaxWeight then
                    --     setHurt()
                    -- else
                    --     setNotHurt()
                    -- end
                    -- print(cb)
                    SendNUIMessage(
                    {
                        action = "setInfoPlayer",
                        playerWeight = cb,
                        maxweight = Config.MaxWeight
                    })
                    -- print(a)
                end
            end)
        end, GetPlayerServerId(PlayerId()) 
    )
end

function setHurt()
    FreezeEntityPosition(PlayerPedId(), true)
end
			 
function setNotHurt()
	 FreezeEntityPosition(PlayerPedId(), false)
end

function showHotbar()
    if not isHotbar then
        isHotbar = true
        SendNUIMessage({
            action = "showhotbar",
            fastItems = fastItemsHotbar,
            itemList = itemslist
        })
        loadPlayerInventory()
        Citizen.Wait(2000)
        
        isHotbar = false
    end
end


--FAST ITEMS
RegisterNUICallback("PutIntoFast", function(data, cb)
    if data.item.slot ~= nil then
        fastWeapons[data.item.slot] = nil
    end
    fastWeapons[data.slot] = data.item.name
    TriggerServerEvent("dream-inventory:changeFastItem",data.slot,data.item.name)
    loadPlayerInventory()
    cb("ok")
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)

RegisterNUICallback("TakeFromFast", function(data, cb)
    fastWeapons[data.item.slot] = nil
    TriggerServerEvent("dream-inventory:changeFastItem",0,data.item.name)
    loadPlayerInventory()
    cb("ok")
    PlaySound(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", 0, 0, 1)
end)



RegisterNetEvent('dream-inventory:client:addItem')
AddEventHandler('dream-inventory:client:addItem', function(itemname, itemlabel)
    local data = { name = itemname, label = itemlabel }
    SendNUIMessage({type = "addInventoryItem", addItemData = data})
end)

RegisterNetEvent('dream-inventory:forcekeluar')
AddEventHandler('dream-inventory:forcekeluar', function()
  closeInventory()
end)

-- -- Custom by TheIrham#0001

-- Citizen.CreateThread(function()
--     for k,v in ipairs(Config.Brankas) do
--         exports["bt-polyzone"]:AddBoxZone("Brankas_"..k..'_'..v.namajob, v.lokasi, 3.0, 3.0, {
--             name="Brankas_"..k..'_'..v.namajob,
--             heading=0,
--             --debugPoly=true,
--             minZ=v.lokasi - 10.0,
--             maxZ=v.lokasi + 10.0
--         })
    

--     RegisterNetEvent('bt-polyzone:enter')
--     AddEventHandler('bt-polyzone:enter', function(name)
--         if name == "Brankas_"..k..'_'..v.namajob then
--             if ESX.GetPlayerData().job.name == v.namajob and ESX.GetPlayerData().job.grade >= v.pangkat then
--                 exports['okokTextUI']:Open(v.tulisan, 'lightgreen', 'left')
--                 RegisterCommand('aksesBrankas', function()
--                     exports['okokTextUI']:Close()
--                     TriggerEvent("dream-inventory:openStorageInventory", "society_"..v.namajob, v.namabrankas)
--                 end)
--             end
--         end
--     end)

--     RegisterNetEvent('bt-polyzone:exit')
--     AddEventHandler('bt-polyzone:exit', function(name)
--         if name == "Brankas_"..k..'_'..v.namajob then
--             exports['okokTextUI']:Close()
--             RegisterCommand('aksesBrankas', function()
                
--             end)
--         end
--     end)
--     end
-- end)

-- RegisterKeyMapping('aksesBrankas', '(by TheIrham#0001) Akses Brankas Job', 'keyboard', 'E')

function getKuantitas(nama)
    local jm = 0
    ESX.TriggerServerCallback('fivemid:getQuantity', function(jumlah)
        jm = jumlah
    end, nama)
    Wait(1000)
    return jm
end

function getMaks(nama, jenis)
    local jm = 0
    ESX.TriggerServerCallback('fivemid:getMaks', function(jumlah)
        jm = jumlah
    end, nama, jenis)
    Wait(1000)
    return jm
end


-- function DrawText3D2(x, y, z, text)
--     local onScreen, _x, _y = World3dToScreen2d(x, y, z)
--     if onScreen then
--         local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
--         local scale = 1.5 * (1 / dist) * (1 / GetGameplayCamFov()) * 100

--         SetTextScale(scale, scale)
--         SetTextFont(4)
--         SetTextProportional(1)
--         SetTextColour(255, 255, 255, 255)
--         SetTextDropShadow(0, 0, 0, 0, 255)
--         SetTextDropShadow()
--         SetTextEdge(4, 0, 0, 0, 255)
--         SetTextOutline()
--         SetTextEntry("STRING")
--         SetTextCentre(1)
--         AddTextComponentString(text)
--         DrawText(_x, _y)
--     end
-- end

function DrawText3D2(x, y, z, text)

    local onScreen, _x, _y = World3dToScreen2d(x, y, z)

    if onScreen then

        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)

        local scale = 1.8 * (1 / dist) * (1 / GetGameplayCamFov()) * 100

        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end


Citizen.CreateThread(function()
    while true do
        sleepth = 1000

        if isInInventory then
            -- DisableControlAction(0, 1, true) -- Disable pan
            -- DisableControlAction(0, 2, true) -- Disable tilt
            -- DisableControlAction(0, 24, true) -- Attack
            -- DisableControlAction(0, 257, true) -- Attack 2
            -- DisableControlAction(0, 25, true) -- Aim
            -- DisableControlAction(0, 263, true) -- Melee Attack 1
            -- DisableControlAction(0, 32, true) -- W
            -- DisableControlAction(0, 34, true) -- A
            -- DisableControlAction(0, 31, true) -- S (fault in Keys table!)
            -- DisableControlAction(0, 30, true) -- D (fault in Keys table!)

            -- DisableControlAction(0, 45, true) -- Reload
            -- DisableControlAction(0, 22, true) -- Jump
            -- DisableControlAction(0, 44, true) -- Cover
            -- DisableControlAction(0, 37, true) -- Select Weapon
            -- DisableControlAction(0, 23, true) -- Also 'enter'?

            -- DisableControlAction(0, 288, true) -- Disable phone
            -- DisableControlAction(0, 289, true) -- Inventory
            -- DisableControlAction(0, 170, true) -- Animations
            -- DisableControlAction(0, 167, true) -- Job

            -- DisableControlAction(0, 0, true) -- Disable changing view
            -- DisableControlAction(0, 26, true) -- Disable looking behind
            -- DisableControlAction(0, 73, true) -- Disable clearing animation
            -- DisableControlAction(2, 199, true) -- Disable pause screen

            -- DisableControlAction(0, 59, true) -- Disable steering in vehicle
            -- DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
            -- DisableControlAction(0, 72, true) -- Disable reversing in vehicle

            -- DisableControlAction(2, 36, true) -- Disable going stealth

            -- DisableControlAction(0, 47, true) -- Disable weapon
            -- DisableControlAction(0, 264, true) -- Disable melee
            -- DisableControlAction(0, 257, true) -- Disable melee
            -- DisableControlAction(0, 140, true) -- Disable melee
            -- DisableControlAction(0, 141, true) -- Disable melee
            -- DisableControlAction(0, 142, true) -- Disable melee
            -- DisableControlAction(0, 143, true) -- Disable melee
            -- DisableControlAction(0, 75, true) -- Disable exit vehicle
            -- DisableControlAction(27, 75, true) -- Disable exit vehicle
            local ped = PlayerPedId()
            local playerCoords = GetEntityCoords(ped)

            local nearbyPlayers = GetNeareastPlayers()
            for k, v in pairs(nearbyPlayers) do
                local x, y, z = table.unpack(v.coords)
                if (GetDistanceBetweenCoords( playerCoords, x, y, z ) < 2.0) then
                    DrawText3D2(x, y, z + 1.20, v.playerId .. '') 
                    DrawText3D2(x, y, z + 1.03, v.playerName .. '') 
                end
            end
            sleepth = 5
        end  
        Wait(sleepth)
    end
    
end)

function GetNeareastPlayers()

    local players = {}

    for _, i in ipairs(GetActivePlayers()) do        -- do stuff
        table.insert(players, 
        { 
            playerName = GetPlayerName(i), 
            playerId = GetPlayerServerId(i), 
            coords = GetEntityCoords(GetPlayerPed(i)) 
        })
    end
    return players
end

exports('getKuantitas', getKuantitas)
exports('getMaks', getMaks)