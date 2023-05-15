ESX = exports["vd_core"]:getSharedObject()

local timing, isPlayerWhitelisted = math.ceil(Config.Timer * 60000), false
local streetName, playerGender

CreateThread(function()
	ESX.PlayerData = ESX.GetPlayerData()
	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job

	isPlayerWhitelisted = refreshPlayerWhitelisted()
end)

RegisterNetEvent('vidi:client:outlawNotify')
AddEventHandler('vidi:client:outlawNotify', function(alert)
	if isPlayerWhitelisted then
		-- TriggerEvent("pNotify:SendNotification", {(alert)})
		notif(alert)
	end
end)

-- Gets the player's current street.
-- Aaalso get the current player gender
CreateThread(function()
	while true do
		Wait(3000)

		local playerCoords = GetEntityCoords(PlayerPedId())
		streetName,_ = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
		streetName = GetStreetNameFromHashKey(streetName)
	end
end)

function refreshPlayerWhitelisted()
	if not ESX.PlayerData then
		return false
	end

	if not ESX.PlayerData.job then
		return false
	end

	for k,v in ipairs(Config.WhitelistedCops) do
		if v == ESX.PlayerData.job.name then
			return true
		end
	end

	return false
end

RegisterNetEvent('vidi:client:gunshotInProgress')
AddEventHandler('vidi:client:gunshotInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.GunshotAlert then
		local alpha = 250
		local gunshotBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipGunRadius)

		SetBlipHighDetail(gunshotBlip, true)
		SetBlipColour(gunshotBlip, 1)
		SetBlipAlpha(gunshotBlip, alpha)
		SetBlipAsShortRange(gunshotBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipGunTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(gunshotBlip, alpha)

			if alpha == 0 then
				RemoveBlip(gunshotBlip)
				return
			end
		end
	end
end)

RegisterNetEvent('vidi:client:combatInProgress')
AddEventHandler('vidi:client:combatInProgress', function(targetCoords)
	if isPlayerWhitelisted and Config.MeleeAlert then
		local alpha = 250
		local meleeBlip = AddBlipForRadius(targetCoords.x, targetCoords.y, targetCoords.z, Config.BlipMeleeRadius)

		SetBlipHighDetail(meleeBlip, true)
		SetBlipColour(meleeBlip, 17)
		SetBlipAlpha(meleeBlip, alpha)
		SetBlipAsShortRange(meleeBlip, true)

		while alpha ~= 0 do
			Citizen.Wait(Config.BlipMeleeTime * 4)
			alpha = alpha - 1
			SetBlipAlpha(meleeBlip, alpha)

			if alpha == 0 then
				RemoveBlip(meleeBlip)
				return
			end
		end
	end
end)


CreateThread(function()
	while true do
		Wait(1)

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)

		if IsPedInMeleeCombat(playerPed) and Config.MeleeAlert then

			Wait(2000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)
				-- notif("~g~[" .. GetPlayerServerId(PlayerId()).. "]~y~ " .. GetPlayerName(PlayerId()).. "~w~Melakukan Pemukulan Di: " .. streetName)

				TriggerServerEvent('vidi:client:combatInProgress', {
					x = ESX.Math.Round(playerCoords.x, 1),
					y = ESX.Math.Round(playerCoords.y, 1),
					z = ESX.Math.Round(playerCoords.z, 1)
				}, streetName, playerGender)
			end

		elseif IsPedShooting(playerPed) and Config.GunshotAlert then

			Wait(2000)

			if (isPlayerWhitelisted and Config.ShowCopsMisbehave) or not isPlayerWhitelisted then
				DecorSetInt(playerPed, 'isOutlaw', 2)
				-- notif("~g~[" .. GetPlayerServerId(PlayerId()).. "]~y~ " .. GetPlayerName(PlayerId()).. "~w~Melakukan Penembakan Di: " .. streetName)
				TriggerServerEvent('vidi:client:gunshotInProgress', { x = ESX.Math.Round(playerCoords.x, 1),y = ESX.Math.Round(playerCoords.y, 1),z = ESX.Math.Round(playerCoords.z, 1)}, streetName, playerGender)
			end
		end
	end
end)

function notif(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(0,1)
end

RegisterNetEvent('shownotiff', function(message)
	if isPlayerWhitelisted then
		notif(message)
	end
end)
