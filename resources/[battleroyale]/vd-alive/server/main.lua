ESX = exports["vd_core"]:getSharedObject()
local connectedPlayers, maxPlayers = {}, GetConvarInt('sv_maxclients', 500)
ESX.RegisterServerCallback('vd-alive:getConnectedPlayers', function(source, cb)
	cb(connectedPlayers, maxPlayers)
end)


AddEventHandler('esx:setJob', function(playerId, job, lastJob)
	connectedPlayers[playerId].job = job.name
	Wait(math.random(1500, 5000))
	TriggerClientEvent('vd-alive:updateConnectedPlayers', -1, connectedPlayers)
end)

AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	AddPlayerToScoreboard(xPlayer, true)
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil
	TriggerClientEvent('vd-alive:updateConnectedPlayers', -1, connectedPlayers)
end)


AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		Wait(1000)
		AddPlayersToScoreboard()
	end
end)

function AddPlayerToScoreboard(xPlayer, update)
	local playerId = xPlayer.source

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].job = xPlayer.job.name

	if update then
		Wait(math.random(1500, 5000))
		TriggerClientEvent('vd-alive:updateConnectedPlayers', -1, connectedPlayers)
	end

	if xPlayer.getGroup() == 'user' then
		Wait(math.random(1500, 5000))
		TriggerClientEvent('vd-alive:toggleID', playerId, false)
	end
end

function AddPlayersToScoreboard()
	local players = ESX.GetPlayers()

	for i=1, #players do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		AddPlayerToScoreboard(xPlayer, false)
	end

	Wait(math.random(1500, 5000))
	TriggerClientEvent('vd-alive:updateConnectedPlayers', -1, connectedPlayers)
end


ESX.RegisterCommand('screfresh', 'admin', function(xPlayer, args, showError)
	AddPlayersToScoreboard()
end, false, {help = 'Refresh vd-alive names!'})

ESX.RegisterCommand('sctoggle', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('vd-alive:toggleID')
end, false, {help = 'Toggle ID column on the scoreboard!'})
