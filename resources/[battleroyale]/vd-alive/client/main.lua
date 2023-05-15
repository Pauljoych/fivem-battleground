ESX = exports["vd_core"]:getSharedObject()


local showPlayerId, isScoreboardActive = true, false
CreateThread(function()
	Wait(2000)
	lib.callback("vd-alive:getConnectedPlayers", false, function(connectedPlayers, maxPlayers)
        UpdatePlayerTable(connectedPlayers)

		SendNUIMessage({
			action = 'updateServerInfo',
			maxPlayers = maxPlayers,
			uptime = 'unknown',
			playTime = '00h 00m'
		})
    end)
end)

RegisterNetEvent('vd-alive:updateConnectedPlayers')
AddEventHandler('vd-alive:updateConnectedPlayers', function(connectedPlayers)
	UpdatePlayerTable(connectedPlayers)
end)

-- RegisterNetEvent('vd-alive:updatePlayersInQueue')
-- AddEventHandler('vd-alive:updatePlayersInQueue', function(playersInQueue)
-- 	SendNUIMessage({action = 'updateServerInfo', playersInQueue = playersInQueue})
-- end)

-- RegisterNetEvent('vd-alive:updatePing')
-- AddEventHandler('vd-alive:updatePing', function(connectedPlayers)
-- 	SendNUIMessage({action = 'updatePing', players = connectedPlayers})
-- end)

-- RegisterNetEvent('vd-alive:toggleID')
-- AddEventHandler('vd-alive:toggleID', function(state)
-- 	if state then
-- 		showPlayerId = state
-- 	else
-- 		showPlayerId = not showPlayerId
-- 	end

-- 	SendNUIMessage({action = 'toggleID', state = showPlayerId})
-- end)

RegisterNetEvent('uptime:tick')
AddEventHandler('uptime:tick', function(uptime)
	SendNUIMessage({action = 'updateServerInfo', uptime = uptime})
end)

function UpdatePlayerTable(connectedPlayers)
	local formattedPlayerList = {}
	local ems, police, taxi, mechanic, cardealer, estate, players = 0, 0, 0, 0, 0, 0, 0

	for k,v in pairs(connectedPlayers) do
		table.insert(formattedPlayerList, ('<tr><td>%s</td><td>%s</td><td>%s</td></tr>'):format(v.name, v.playerId, v.ping))
		players = players + 1

		if v.job == 'unemployed' then
			ems = ems + 1
		end
	end

	SendNUIMessage({action = 'updatePlayerList', players = table.concat(formattedPlayerList)})

	SendNUIMessage({
		action = 'updatePlayerJobs',
		jobs = {ems = ems, police = police, taxi = taxi, mechanic = mechanic, cardealer = cardealer, estate = estate, player_count = players}
	})
end

AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() and isScoreboardActive then
		SetNuiFocus(false)
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		isScoreboardActive = true
		SendNUIMessage({action = 'enable'})
		Wait(1000)
	end
end)

RegisterNUICallback('onCloseMenu', function()
	isScoreboardActive = false
	SetNuiFocus(false)
end)

CreateThread(function()
	local playMinute, playHour = 0, 0

	while true do
		Wait(60000)
		playMinute = playMinute + 1

		if playMinute == 60 then
			playMinute = 0
			playHour = playHour + 1
		end

		SendNUIMessage({
			action = 'updateServerInfo',
			playTime = string.format("%02dh %02dm", playHour, playMinute)
		})
	end
end)
