ESX = exports["vd_core"]:getSharedObject()
ServerItems = {}
itemShopList = {}


ESX.RegisterServerCallback(
	"dream-inventory:getPlayerInventory",
	function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)
		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)
ESX.RegisterServerCallback(
		"dream-inventory:getPlayerInventoryWeight",
		function(source,cb)
			local _source = source
			local xPlayer = ESX.GetPlayerFromId(_source)
			if Config.PakaiESX == 'baru' then
				local playerweight = xPlayer.getWeight()
				-- print(playerweight)
				cb(playerweight)
			elseif Config.PakaiESX == 'lama' then
				local playerweight = 0
				cb(playerweight)
			end
			
 end)

RegisterNetEvent("dream-inventory:clearweapons")
AddEventHandler("dream-inventory:clearweapons",
function(target)
	TriggerClientEvent('dream-inventory:clearfastitems',target)
end)

RegisterServerEvent("dream-inventory:doClose")
AddEventHandler("dream-inventory:doClose", function(target)
    TriggerClientEvent("dream-inventory:doClose", target)
end)

ESX.RegisterServerCallback('dream-inventory:takePlayerItem', function(source, cb, item, count)
    local player = ESX.GetPlayerFromId(source)
    local invItem = player.getInventoryItem(item)
    if invItem.count - count < 0 then
        cb(false)
    else
        player.removeInventoryItem(item, count)
        cb(true)
    end
end)

ESX.RegisterServerCallback('tqrp_inventoryhud:addPlayerItem', function(source, cb, item, count)
    local player = ESX.GetPlayerFromId(source)
		player.addInventoryItem(item, count)
		cb(true)
end)

RegisterServerEvent("dream-inventory:tradePlayerItem")
AddEventHandler(
	"dream-inventory:tradePlayerItem",
	function(from, target, type, itemName, itemCount)
		local _source = from
		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)
		local item = sourceXPlayer.getInventoryItem(itemName)


		if type == "item_standard" then
            if itemCount > 0 and item.count >= itemCount then
                sourceXPlayer.removeInventoryItem(itemName, itemCount)
				targetXPlayer.addInventoryItem(itemName, itemCount)
            end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end

		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'O destinatário já tem essa arma!' })
			end
		elseif type == "item_black" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'O destinatário já tem essa arma!' })
			end
		end
	end
)

RegisterCommand(
	"steal",
	function(source)
		local _source = source
		TriggerClientEvent('dream-inventory:steal', _source)
	end
)
RegisterCommand(
		"closeinventory",
		function(source)
			local _source = source
			TriggerClientEvent('dream-inventory:closeinventory', _source)
		end
)
RegisterServerEvent("suku:sendShopItems")
AddEventHandler("suku:sendShopItems", function(source, itemList)
	itemShopList = itemList
end)

ESX.RegisterServerCallback("suku:getShopItems", function(source, cb, shoptype)
	itemShopList = {}
	if Config.PakaiESX == 'baru' then
		local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
		local itemInformation = {}
		for i=1, #itemResult, 1 do
			if itemInformation[itemResult[i].name] == nil then
				itemInformation[itemResult[i].name] = {}
			end
			itemInformation[itemResult[i].name].name = itemResult[i].name
			itemInformation[itemResult[i].name].label = itemResult[i].label
			itemInformation[itemResult[i].name].weight = itemResult[i].weight
			itemInformation[itemResult[i].name].rare = itemResult[i].rare
			itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
			if shoptype == "regular" then
				for _, v in pairs(Config.Shops.RegularShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "ilegal" then
				for _, v in pairs(Config.Shops.IlegalShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "robsliquor" then
				for _, v in pairs(Config.Shops.RobsLiquor.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "mekanik" then
				for _, v in pairs(Config.Shops.Mekanik.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "rumahsakit" then
				for _, v in pairs(Config.Shops.RumahSakit.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "youtool" then
				for _, v in pairs(Config.Shops.YouTool.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "policeshop" then
				for _, v in pairs(Config.Shops.PoliceShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "prison" then
				for _, v in pairs(Config.Shops.PrisonShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "weaponshop" then
				for _, v in pairs(Config.Shops.WeaponShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_weapon",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "blackmarketItem" then
				for _, v in pairs(Config.Shops.blackmarketItem.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black2",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
		end
	elseif Config.PakaiESX == 'lama' then
		local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
		local itemInformation = {}
		for i=1, #itemResult, 1 do
			if itemInformation[itemResult[i].name] == nil then
				itemInformation[itemResult[i].name] = {}
			end
			itemInformation[itemResult[i].name].name = itemResult[i].name
			itemInformation[itemResult[i].name].label = itemResult[i].label
			itemInformation[itemResult[i].name].limit = itemResult[i].limit
			itemInformation[itemResult[i].name].rare = itemResult[i].rare
			itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
			if shoptype == "regular" then
				for _, v in pairs(Config.Shops.RegularShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "ilegal" then
				for _, v in pairs(Config.Shops.IlegalShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "robsliquor" then
				for _, v in pairs(Config.Shops.RobsLiquor.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "mekanik" then
				for _, v in pairs(Config.Shops.Mekanik.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "rumahsakit" then
				for _, v in pairs(Config.Shops.RumahSakit.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "youtool" then
				for _, v in pairs(Config.Shops.YouTool.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "policeshop" then
				for _, v in pairs(Config.Shops.PoliceShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "prison" then
				for _, v in pairs(Config.Shops.PrisonShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "weaponshop" then
				for _, v in pairs(Config.Shops.WeaponShop.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_weapon",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
			if shoptype == "blackmarketItem" then
				for _, v in pairs(Config.Shops.blackmarketItem.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black2",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = v.price,
							pricesell = v.pricesell,
							count = 99999999
						})
					end
				end
			end
		end
	end
	cb(itemShopList)
end)

ESX.RegisterServerCallback("suku:getCustomShopItems", function(source, cb, shoptype, customInventory)
	itemShopList = {}
	if Config.PakaiESX == 'baru' then
		local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
		local itemInformation = {}
		for i=1, #itemResult, 1 do
			if itemInformation[itemResult[i].name] == nil then
				itemInformation[itemResult[i].name] = {}
			end
			itemInformation[itemResult[i].name].name = itemResult[i].name
			itemInformation[itemResult[i].name].label = itemResult[i].label
			itemInformation[itemResult[i].name].weight = itemResult[i].weight
			itemInformation[itemResult[i].name].rare = itemResult[i].rare
			itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
			if shoptype == "normal" then
				for _, v in pairs(customInventory.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
			end

			if shoptype == "weapon" then
				local weapons = customInventory.Weapons
				for _, v in pairs(customInventory.Weapons) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_weapon",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
				for _, v in pairs(customInventory.Weapons) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
				local ammo = customInventory.Ammo
				for _,v in pairs(customInventory.Ammo) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_ammo",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							weaponhash = v.weaponhash,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end

				for _, v in pairs(customInventory.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].weight,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
			end
		end
	elseif Config.PakaiESX == 'lama' then
		local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
		local itemInformation = {}
		for i=1, #itemResult, 1 do
			if itemInformation[itemResult[i].name] == nil then
				itemInformation[itemResult[i].name] = {}
			end
			itemInformation[itemResult[i].name].name = itemResult[i].name
			itemInformation[itemResult[i].name].label = itemResult[i].label
			itemInformation[itemResult[i].name].limit = itemResult[i].limit
			itemInformation[itemResult[i].name].rare = itemResult[i].rare
			itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
			if shoptype == "normal" then
				for _, v in pairs(customInventory.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
			end

			if shoptype == "weapon" then
				local weapons = customInventory.Weapons
				for _, v in pairs(customInventory.Weapons) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_weapon",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
				for _, v in pairs(customInventory.Weapons) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_black",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
				local ammo = customInventory.Ammo
				for _,v in pairs(customInventory.Ammo) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_ammo",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = 0,
							weaponhash = v.weaponhash,
							ammo = v.ammo,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end

				for _, v in pairs(customInventory.Items) do
					if v.name == itemResult[i].name then
						table.insert(itemShopList, {
							type = "item_standard",
							name = itemInformation[itemResult[i].name].name,
							label = itemInformation[itemResult[i].name].label,
							weight = itemInformation[itemResult[i].name].limit,
							rare = itemInformation[itemResult[i].name].rare,
							can_remove = itemInformation[itemResult[i].name].can_remove,
							price = itemInformation[itemResult[i].name].price,
							count = 99999999
						})
					end
				end
			end
		end
	end
	cb(itemShopList)
end)
RegisterNetEvent("suku:SellItemToPlayer")
AddEventHandler("suku:SellItemToPlayer",function(source, type, item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if Config.PakaiESX == 'lama' then
		if type == "item_standard" then
			local targetItem = xPlayer.getInventoryItem(item)
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if xPlayer.getMoney() >= totalPrice then
							if (targetItem.count + count) <= targetItem.limit then
								xPlayer.removeMoney(totalPrice)
								xPlayer.addInventoryItem(item, count)
								TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli '..count..'x '..list[i].label..' dengan harga $'..ESX.Math.GroupDigits(totalPrice))
							else
								TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Ruang tas kamu tidak cukup!')
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uangmu tidak cukup!')
						end
					end
				end
		end

		if type == "item_black2" then
			local targetItem = xPlayer.getInventoryItem(item)
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if xPlayer.getAccount('black_money').money >= totalPrice then
							if (targetItem.count + count) <= targetItem.limit then
								xPlayer.removeAccountMoney('black_money', totalPrice)
								xPlayer.addInventoryItem(item, count)
								TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli '..count..'x '..list[i].label)
							else
								TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Ruang tas kamu tidak cukup!')
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uang Kotormu tidak cukup!')
						end
					end
				end
		end

		if type == "item_weapon" then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if not xPlayer.hasWeapon(list[i].name) then
							if xPlayer.getMoney() >= totalPrice then
								xPlayer.removeMoney(totalPrice)
								xPlayer.addWeapon(list[i].name, 100)
								TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli senjata '..list[i].label)
							else
								TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uangmu tidak cukup!')
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata '..list[i].label..'!')
						end
					end
				end
		end

		if type == "item_black" then
			local targetItem = xPlayer.getInventoryItem(item)
			if targetItem.count < 1 then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local targetWeapon = xPlayer.hasWeapon(tostring(list[i].name))
						if not targetWeapon then
							local totalPrice = 1 * list[i].price
							if xPlayer.getAccount('black_money').money >= totalPrice then
								if not targetWeapon then
									xPlayer.removeAccountMoney('black_money',totalPrice)
									xPlayer.addWeapon(list[i].name, 100)
									TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli senjata '..list[i].label)
								else
									TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata '..list[i].label..'!')
								end
							else
								TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Não tens dinheiro suficiente!' })
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata ini!')
						end
					end
				end
			else
				TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Anda tidak dapat memuat apa pun di inventaris Anda!')
			end
		end

		if type == "item_ammo" then
			local targetItem = xPlayer.getInventoryItem(item)
			local list = itemShopList
			for i = 1, #list, 1 do
				if list[i].name == item then
					local targetWeapon = xPlayer.hasWeapon(list[i].weaponhash)
					if targetWeapon then
						local totalPrice = count * list[i].price
						local ammo = count * list[i].ammo
						if xPlayer.getMoney() >= totalPrice then
							xPlayer.removeMoney(totalPrice)
							TriggerClientEvent("suku:AddAmmoToWeapon", source, list[i].weaponhash, ammo)
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste '..count.." "..list[i].label })
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uang kamu tidak cukup!')
						end
					else
						TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Anda tidak dapat memuat apa pun di inventaris Anda!')
					end
				end
			end
		end
	elseif Config.PakaiESX == 'baru' then
		if type == "item_standard" then
			local targetItem = xPlayer.getInventoryItem(item)
			if xPlayer.canCarryItem(item, count) then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if xPlayer.getMoney() >= totalPrice then
							xPlayer.removeMoney(totalPrice)
							xPlayer.addInventoryItem(item, count)
							TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli '..count..'x '..list[i].label)
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uangmu tidak cukup!')
						end
					end
				end
			else
				TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Ruang tas kamu tidak cukup!')
			end
		end

		if type == "item_black2" then
			local targetItem = xPlayer.getInventoryItem(item)
			if xPlayer.canCarryItem(item, count) then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if xPlayer.getAccount('black_money').money >= totalPrice then
							xPlayer.removeAccountMoney('black_money', totalPrice)
							xPlayer.addInventoryItem(item, count)
							TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli '..count..'x '..list[i].label)
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uang Kotormu tidak cukup!')
						end
					end
				end
			else
				TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Ruang tas kamu tidak cukup!')
			end
		end

		if type == "item_weapon" then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local totalPrice = count * list[i].price
						if not xPlayer.hasWeapon(list[i].name) then
							if xPlayer.getMoney() >= totalPrice then
								xPlayer.removeMoney(totalPrice)
								xPlayer.addWeapon(list[i].name, 100)
								TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli senjata '..list[i].label)
							else
								TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uangmu tidak cukup!')
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata '..list[i].label..'!')
						end
					end
				end
		end

		if type == "item_black" then
			local targetItem = xPlayer.getInventoryItem(item)
			if targetItem.count < 1 then
				local list = itemShopList
				for i = 1, #list, 1 do
					if list[i].name == item then
						local targetWeapon = xPlayer.hasWeapon(tostring(list[i].name))
						if not targetWeapon then
							local totalPrice = 1 * list[i].price
							if xPlayer.getAccount('black_money').money >= totalPrice then
								if not targetWeapon then
									xPlayer.removeAccountMoney('black_money',totalPrice)
									xPlayer.addWeapon(list[i].name, 100)
									TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli senjata '..list[i].label)
								else
									TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata '..list[i].label..'!')
								end
							else
								TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uangmu tidak cukup!')
							end
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata ini!')
						end
					end
				end
			else
				TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Anda tidak dapat memuat apa pun di inventaris Anda!')
			end
		end

		if type == "item_ammo" then
			local targetItem = xPlayer.getInventoryItem(item)
			local list = itemShopList
			for i = 1, #list, 1 do
				if list[i].name == item then
					local targetWeapon = xPlayer.hasWeapon(list[i].weaponhash)
					if targetWeapon then
						local totalPrice = count * list[i].price
						local ammo = count * list[i].ammo
						if xPlayer.getMoney() >= totalPrice then
							xPlayer.removeMoney(totalPrice)
							TriggerClientEvent("suku:AddAmmoToWeapon", source, list[i].weaponhash, ammo)
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Uang kamu tidak cukup!')
						end
					else
						TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Anda tidak dapat memuat apa pun di inventaris Anda!')
					end
				end
			end
		end
	end
end)

RegisterNetEvent("suku:SellItemFromPlayer")
AddEventHandler("suku:SellItemFromPlayer",function(source, type, item, count)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if type == "item_standard" then
		local targetItem = xPlayer.getInventoryItem(item)
			local list = itemShopList
			for i = 1, #list, 1 do
				if list[i].name == item then
					local totalPrice = count * list[i].pricesell
						if targetItem.count >= count then
							xPlayer.addMoney(totalPrice)
							xPlayer.removeInventoryItem(item, count)
							TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terjual '..count..'x '..list[i].label..' dan mendapatkan $'..ESX.Math.GroupDigits(totalPrice))
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu tidak memiliki barang dengan jumlah tersebut!')
						end
				end
			end
	end
	if type == "item_black2" then
		local targetItem = xPlayer.getInventoryItem(item)
			local list = itemShopList
			for i = 1, #list, 1 do
				if list[i].name == item then
					local totalPrice = count * list[i].pricesell
						if targetItem.count >= count then
							xPlayer.addAccountMoney('black_money',totalPrice)
							xPlayer.removeInventoryItem(item, count)
							TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terjual '..count..'x '..list[i].label..' dan mendapatkan Uang Kotor $'..ESX.Math.GroupDigits(totalPrice))
						else
							TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu tidak memiliki barang dengan jumlah tersebut!')
						end
				end
			end
	end
	if type == "item_weapon" then
		local list = itemShopList
		for i = 1, #list, 1 do
			if list[i].name == item then
				local totalPrice = count * list[i].pricesell
				if xPlayer.hasWeapon(list[i].name) then
						xPlayer.removeMoney(totalPrice)
						xPlayer.addWeapon(list[i].name, 100)
						TriggerClientEvent('fivemid-notif:kasihNotif', source, true, 'Sukses terbeli senjata '..list[i].label)
				else
					TriggerClientEvent('fivemid-notif:kasihNotif', source, false, 'Kamu sudah memiliki senjata '..list[i].label..'!')
				end
			end
		end
end
end)

Citizen.CreateThread(function()
	Citizen.Wait(10)
	MySQL.Async.fetchAll('SELECT * FROM items WHERE LCASE(name) LIKE \'%weapon_%\'', {}, function(results)
		for k, v in pairs(results) do
			ESX.RegisterUsableItem(v.name, function(source)
				TriggerClientEvent('dream-inventory:useWeapon', source, v.name)
			end)
		end
	end)
end)

RegisterServerEvent('dream-inventory:updateAmmoCount')
AddEventHandler('dream-inventory:updateAmmoCount', function(hash, wepInfo)
	local player = ESX.GetPlayerFromId(source)
	MySQL.Async.execute('UPDATE disc_ammo SET count = @count, attach = @attach WHERE hash = @hash AND owner = @owner', {
		['@owner'] = player.identifier,
		['@hash'] = hash,
		['@count'] = wepInfo.count,
		['@attach'] = json.encode(wepInfo.attach)
	}, function(results)
		if results == 0 then
			MySQL.Async.execute('INSERT INTO disc_ammo (owner, hash, count, attach) VALUES (@owner, @hash, @count, @attach)', {
				['@owner'] = player.identifier,
				['@hash'] = hash,
				['@count'] = wepInfo.count,
				['@attach'] = json.encode(wepInfo.attach)
			})
		end
	end)
end)

ESX.RegisterServerCallback('dream-inventory:getAmmoCount', function(source, cb, hash)
	local player = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM disc_ammo WHERE owner = @owner and hash = @hash', {
		['@owner'] = player.identifier,
		['@hash'] = hash
	}, function(results)
		if #results == 0 then
			local cbResult = {
				ammoCount = nil,
				attachments = {}
			}
			cb(cbResult)
		else
			local cbResult = {
				ammoCount = results[1].count,
				attachments = json.decode(results[1].attach)
			}
			cb(cbResult)
		end
	end)
end)


Citizen.CreateThread(function()
	for i = 1, #Config.Attachments do
		ESX.RegisterUsableItem(Config.Attachments[i], function(source)
			TriggerClientEvent("tqrp_inventoryhud:useAttach", source, Config.Attachments[i])
		end)
	end
end)

ESX.RegisterServerCallback('GetCharacterNameServer', function(source, cb, target) -- GR10
    local xTarget = ESX.GetPlayerFromId(target)

    local result = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
        ['@identifier'] = xTarget.identifier
    })

    local firstname = result[1].firstname
    local lastname  = result[1].lastname

    cb(''.. firstname .. ' ' .. lastname ..'')
end)

ESX.RegisterServerCallback('roy:getNamaIC', function(source, cb, target, data)

    local identifier = GetPlayerIdentifiers(source)[1]
    local hasil = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier AND firstname = firstname AND lastname = lastname", { ['@identifier'] = identifier })
    local namaic = hasil[1].firstname..' '..hasil[1].lastname

    cb(namaic)
end)

ESX.RegisterServerCallback('fivemid:ceklimit', function(source, cb, nama, count)
	-- print('a')
	local xPlayer = ESX.GetPlayerFromId(source)
    local targetItem = xPlayer.getInventoryItem(nama)

	if (targetItem.count + count) <= targetItem.limit then
		cb(true)
	else
		cb(false)
	end
end)

ESX.RegisterServerCallback('fivemid:getQuantity', function(source, cb, nama)
	local xPlayer = ESX.GetPlayerFromId(source)
    local targetItem = xPlayer.getInventoryItem(nama)

	cb(targetItem.count)
end)

ESX.RegisterServerCallback('fivemid:getMaks', function(source, cb, nama, jenis)
	local xPlayer = ESX.GetPlayerFromId(source)
    local targetItem = xPlayer.getInventoryItem(nama)
	if Config.PakaiESX == 'lama' then
		cb(targetItem.limit)
	elseif Config.PakaiESX == 'baru' and jenis == 'weight' then
		cb(targetItem.weight)
	elseif Config.PakaiESX == 'baru' and jenis == 'limit' then
		cb(targetItem.limit)
	end
end)