
ESX = exports["vd_core"]:getSharedObject()

RegisterServerEvent('vidi:client:combatInProgress')
AddEventHandler('vidi:client:combatInProgress', function(targetCoords, streetName, playerGender)
	local src = source

	-- TriggerClientEvent('vidi:client:outlawNotify', -1, _U('combat', playerGender, streetName))
	TriggerClientEvent('shownotiff', -1, "~g~[" .. src.. "] ~y~" .. GetPlayerName(src) .. "~w~ Melakukan Pemukulan di: " ..streetName)
	TriggerClientEvent('vidi:client:combatInProgress', -1, targetCoords)
end)

RegisterServerEvent('vidi:client:gunshotInProgress')
AddEventHandler('vidi:client:gunshotInProgress', function(targetCoords, streetName, playerGender)
	local src = source

	-- TriggerClientEvent('vidi:client:outlawNotify', -1, _U('gunshot', playerGender, streetName))
	TriggerClientEvent('shownotiff', -1, "~g~[" .. src.. "] ~y~" .. GetPlayerName(src) .. "~w~ Melakukan Penembakan di: " ..streetName)
	TriggerClientEvent('vidi:client:gunshotInProgress', -1, targetCoords)
end) 