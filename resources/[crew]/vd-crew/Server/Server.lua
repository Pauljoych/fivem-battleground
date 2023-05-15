crews = {}
invites = {}


---------------- OneSync Infinity
CreateThread(function()
	while onesync_infinity and enable_blips do
		for i,k in pairs(crews) do
			for j,c in pairs(k.players) do
				if c.source ~= -1 then
					local ped = GetPlayerPed(c.source)
					c.coords = GetEntityCoords(ped)
					c.heading = GetEntityHeading(ped)
				end
			end
		end

		for i,k in pairs(crews) do
			for j,c in pairs(k.players) do
				if c.source ~= -1 then
					TriggerClientEvent("vd-crew:SendCoords", c.source, k.players)
				end
			end
		end

		Wait(send_coords_time)
	end
end)


---------------- EVENTS

RegisterNetEvent('vd-crew:LoadCrew')
AddEventHandler('vd-crew:LoadCrew', function()
	local idJ = source
	local crew, player = GetPlayerCrew(idJ)

	if crew then
		player.source = idJ
		
		for i,k in pairs(crew.players) do
			if k.source ~= -1 then
				TriggerClientEvent('vd-crew:LoadCrew', k.source, crew)
			end
		end
	end
end)

AddEventHandler('playerDropped', function(reason)
	local idJ = source
	local crew, player = GetPlayerCrew(idJ)

	if crew and player.source then
		player.source = -1

		for i,k in pairs(crew.players) do
			if k.source ~= -1 then
				TriggerClientEvent('vd-crew:LoadCrew', k.source, crew)
			end
		end
	end
end)

RegisterNetEvent('vd-crew:InvitePlayer')
AddEventHandler('vd-crew:InvitePlayer', function(targetSource)
	local idJ = source
	local identifier = getIdentifier(idJ)

	if not HasPermission(idJ, "manager") then
		showNotification(idJ, translate.TR_NOT_PERMISSION)
		return
	end

	if not targetSource then
		showNotification(idJ, translate.TR_NOT_FOUND)
		return
	end

	local hasCrew = GetPlayerCrew(targetSource)

	if hasCrew then
		showNotification(idJ, translate.TR_HAS_CREW)
		return
	end
	
	local crew = GetPlayerCrew(idJ)

	InvitePlayerCrew(targetSource, crew)		
	showNotification(idJ, translate.TR_SEND_INVITE)

	local name = getName(idJ)
	local tname = getName(targetSource)
	local targetIdentifier = getIdentifier(targetSource)

	local message = translate.TR_DISCORD_1 ..
	"\n\n" .. translate.TR_DISCORD_2 .. name ..
	"\n" .. translate.TR_DISCORD_3 .. identifier ..
	"\n" .. translate.TR_DISCORD_4 .. tname ..
	"\n" .. translate.TR_DISCORD_3 .. targetIdentifier ..
	"\n" .. translate.TR_DISCORD_5 .. crew.name

	sendWebhook(message)
end)

RegisterNetEvent('vd-crew:JoinCrew')
AddEventHandler('vd-crew:JoinCrew', function()
	local idJ = source
	
	if not GetPlayerCrew(idJ) then
		JoinPlayerCrew(idJ)
	else
		showNotification(idJ, translate.TR_HAS_CREW2)
	end
end)

RegisterNetEvent('vd-crew:ProvePlayer')
AddEventHandler('vd-crew:ProvePlayer', function(targetSource)
	local idJ = source
	
	if not HasPermission(idJ, "owner") then
		showNotification(idJ, translate.TR_NOT_PERMISSION)
		return
	end	
	
	if not targetSource or targetSource == idJ then
		showNotification(idJ, translate.TR_NOT_FOUND)
		return
	end
	
	local crew, player = GetPlayerCrew(targetSource)
	local myCrew, myPlayer = GetPlayerCrew(idJ)

	if not crew or crew.name ~= myCrew.name then
		showNotification(idJ, translate.TR_NOT_PART)
		return
	end

	player.grade = "manager"

	local targetIdentifier = getIdentifier(targetSource)
	_updatecrew(targetIdentifier, 'manager')

	showNotification(idJ, translate.TR_RECEIVE_PROVE)
	showNotification(targetSource, translate.TR_RECEIVE_PROVE2)

	local name = getName(idJ)
	local tname = getName(targetSource)
	local targetIdentifier = getIdentifier(targetSource)
	local identifier = getIdentifier(idJ)

	local message = translate.TR_DISCORD_6 ..
	"\n\n" .. translate.TR_DISCORD_7 .. name ..
	"\n" .. translate.TR_DISCORD_3 .. identifier ..
	"\n" .. translate.TR_DISCORD_8 .. tname ..
	"\n" .. translate.TR_DISCORD_3 .. targetIdentifier ..
	"\n" .. translate.TR_DISCORD_9 .. crew.name

	sendWebhook(message)
end)

RegisterNetEvent('vd-crew:DemotePlayer')
AddEventHandler('vd-crew:DemotePlayer', function(targetSource)
	local idJ = source
	
	if not HasPermission("owner") then
		showNotification(idJ, translate.TR_NOT_PERMISSION)
		return
	end	
	
	if not targetSource or targetSource == idJ then
		showNotification(idJ, translate.TR_NOT_FOUND)
		return
	end
	
	local crew, player = GetPlayerCrew(targetSource)
	local myCrew, myPlayer = GetPlayerCrew(idJ)
	
	if not crew or crew.name ~= myCrew.name then
		showNotification(idJ, translate.TR_NOT_PART)
		return
	end

	player.grade = "user"

	local targetIdentifier = getIdentifier(targetSource)
	_updatecrew(targetIdentifier, 'user')

	showNotification(idJ, translate.TR_RECEIVE_DEMOTE)
	showNotification(targetSource, translate.TR_RECEIVE_DEMOTE)
end)

RegisterNetEvent('vd-crew:KickPlayer')
AddEventHandler('vd-crew:KickPlayer', function(namePlayer)
	local idJ = source	
	local name = getName(idJ)
	
	if not HasPermission(idJ, "manager") then
		showNotification(idJ, translate.TR_NOT_PERMISSION)
		return
	end
	
	if not namePlayer or namePlayer == name then
		showNotification(idJ, translate.TR_NOT_FOUND)
		return
	end

	local myCrew, myPlayer = GetPlayerCrew(idJ)
	local found = false
	for i,k in pairs(myCrew.players) do
		if k.name_player == namePlayer then
			found = true
			break
		end
	end
	
	if not found then
		showNotification(idJ, translate.TR_NOT_PART)
		return
	end

	local targetSource = -1
	for i,k in pairs(myCrew.players) do
		if k.name_player == namePlayer then
			if k.grade ~= "owner" and ((myPlayer.grade == "manager" and k.grade ~= "manager") or myPlayer.grade == "owner" ) then
				targetSource = k.source

				table.remove(myCrew.players, i)
				_leftcrew(k.identifier)

				local name = getName(idJ)
				local tname = getName(targetSource)
				local targetIdentifier = getIdentifier(targetSource)
				local identifier = getIdentifier(idJ)

				local message = translate.TR_DISCORD_10 ..
				"\n\n" .. translate.TR_DISCORD_11 .. name ..
				"\n" .. translate.TR_DISCORD_3 .. identifier ..
				"\n" .. translate.TR_DISCORD_12 .. tname ..
				"\n" .. translate.TR_DISCORD_3 .. targetIdentifier ..
				"\n" .. translate.TR_DISCORD_13 .. myCrew.name

				sendWebhook(message)
			else
				showNotification(idJ, translate.TR_NOT_PERMISSION)
				return
			end
			
			break
		end
	end

	for _, k in pairs(myCrew.players) do
		if k.source ~= -1 then
			TriggerClientEvent('vd-crew:LoadCrew', k.source, myCrew)
		end
	end


	if targetSource ~= -1 then
		TriggerClientEvent('vd-crew:LoadCrew', targetSource, {})
		showNotification(targetSource, translate.TR_KICK2)
	end
	
	showNotification(idJ, translate.TR_KICK)
end)

RegisterNetEvent('vd-crew:AddKillCrew')
AddEventHandler('vd-crew:AddKillCrew', function(sourceKiller)
	local idJ = source

	local victimCrew = GetPlayerCrew(idJ)
	local killerCrew = GetPlayerCrew(sourceKiller)

	if killerCrew then
		if victimCrew and victimCrew.name == killerCrew.name then
			return
		end

		_updateranking(killerCrew.name, #killerCrew.players)

		local name = getName(idJ)
		local tname = getName(sourceKiller)
		local targetIdentifier = getIdentifier(sourceKiller)
		local identifier = getIdentifier(idJ)

		local message = translate.TR_DISCORD_14 ..
		"\n\n" .. translate.TR_DISCORD_15 .. tname ..
		"\n" .. translate.TR_DISCORD_3 .. targetIdentifier ..
		"\n" .. translate.TR_DISCORD_16 .. name ..
		"\n" .. translate.TR_DISCORD_3 .. identifier ..
		"\n" .. translate.TR_DISCORD_17 .. killerCrew.name

		sendWebhook(message)
	end
end)

---------------- FUNCTIONS
function HasPermission(source, grade)
	local crew, player = GetPlayerCrew(source)

	if crew then
		return player.grade == "owner" or player.grade == grade
	end

	return false
end

function GetPlayerByName(namePlayer)
	local xPlayers = GetPlayersOnline()

	for i,k in pairs(xPlayers) do
		local xName = getName(k)

		if xName == namePlayer then
			return k
		end
	end

	return nil
end

function GetPlayerCrew(source)
	local identifier = getIdentifier(source)
	
	while not identifier and GetPlayerIdentifier(source, 0) do
		identifier = getIdentifier(source)
		Wait(5000)
	end

	for _, crew in pairs(crews) do
		for _, player in pairs(crew.players) do
			if player.identifier == identifier then
				return crew, player
			end
		end
	end

	return nil
end

function InvitePlayerCrew(source, crew)	
	local identifier = getIdentifier(source)

	showNotification(source, translate.TR_RECEIVE_INVITE .. ' ' .. crew.name)
	TriggerClientEvent('chat:addMessage', source, { args = { translate.TR_RECEIVE_INVITE2 }})

	TriggerClientEvent('vd-crew:ReceiveInvite', source, crew.name)

	invites[identifier] = crew
end

function JoinPlayerCrew(source)
	local identifier = getIdentifier(source)
	local name = getName(source)
	local crew = invites[identifier]

	if crew then
		_insertcrew(crew.name, identifier, name, 'user')

		table.insert(crew.players, {
			identifier = identifier, 
			source = source, 
			name_player = name,
			grade = "user"
		})	

		for _, k in pairs(crew.players) do
			if k.source ~= -1 then
				TriggerClientEvent('vd-crew:LoadCrew', k.source, crew)
			end
		end

		local message = translate.TR_DISCORD_18 ..
		"\n\n" .. translate.TR_DISCORD_19 .. name ..
		"\n" .. translate.TR_DISCORD_3 .. identifier ..
		"\n" .. translate.TR_DISCORD_20 .. crew.name

		sendWebhook(message)
	end

	invites[identifier] = nil
end

function LeftPlayerCrew(source, crewName)
	local identifier = getIdentifier(source)

	for _, crew in pairs(crews) do
		if crew.name == crewName then
			for i, player in pairs(crew.players) do
				if player.identifier == identifier then
					if player.grade ~= "owner" then
						table.remove(crew.players, i)
						_leftcrew(identifier)
						showNotification(source, translate.TR_EXIT)
					else
						showNotification(source, translate.TR_DONT_EXIT)
						TriggerClientEvent('chat:addMessage', source, { args = { translate.TR_DONT_EXIT2 }})
						return
					end
					
					break
				end
			end

			for _, k in pairs(crew.players) do
				if k.source ~= -1 then
					TriggerClientEvent('vd-crew:LoadCrew', k.source, crew)
				end
			end

			TriggerClientEvent('vd-crew:LoadCrew', source, {})
		end
	end
end

function DeleteCrew(source, crew)
	local identifier = getIdentifier(source)

	for i, k in pairs(crew.players) do
		if k.source ~= -1 then
			showNotification(k.source, translate.TR_NOTIFY_DELETE)	
			TriggerClientEvent('vd-crew:DeletedCrew', k.source)
		end
		
	end

	for i,k in pairs(crews) do
		if k.name == crew.name then
			table.remove(crews, i)
			break
		end
	end
	
	_deletecrew(crew.name)
	_deleteranking(crew.name)
end

--------------- DISCORD

function sendWebhook(message)
    local send = {
        {
            ["color"] = WEBHOOK.COLOR,
            ["title"] = WEBHOOK.DISCORD_TITLE,
            
            ['thumbnail'] = {
                ['url'] = WEBHOOK.SIMBOL_IMG,
                ['height'] = WEBHOOK.HEIGHT_SIMBOL,
                ['width'] = WEBHOOK.WIDTH_SIMBOL
            },
            ["description"] = message,
            ["footer"] = {
                ["text"] = WEBHOOK.DISCORD_FOOTER,
                ['icon_url'] = WEBHOOK.DISCORD_FOOTER_IMG
            },
        }
    }
    PerformHttpRequest(WEBHOOK.DISCORD_URL, function(err, text, headers) end, 'POST', json.encode({username = WEBHOOK.DISCORD_NAME, embeds = send, avatar_url = WEBHOOK.DISCORD_AVATAR}), { ['Content-Type'] = 'application/json' })
end