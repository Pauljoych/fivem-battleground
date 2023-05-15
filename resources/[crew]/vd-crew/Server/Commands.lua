RegisterCommand(commands.createcrew, function(source, args)
	local nameCrew = args[1]
	local identifier = getIdentifier(source)
	local name = getName(source)
	local crew = GetPlayerCrew(source)

	if nameCrew then
		for _, crew in pairs(crews) do
			if string.lower(crew.name) == string.lower(nameCrew) then
				showNotification(source, translate.TR_CANOT_NAME)
				return
			end
		end
				
		if crew then
			showNotification(source, translate.TR_CANOT_CREATE)
			TriggerClientEvent('chat:addMessage', source, { args = { translate.TR_CANOT_CREATE2 }})
			return
		end
			

		table.insert(crews, {
			name = nameCrew,
			players = {
				{identifier = identifier, source = source, name_player = name, grade = "owner"}
			}
		})

		_insertcrew(nameCrew, identifier, name, 'owner')
		_insertranking(nameCrew)

		local crew = GetPlayerCrew(source)
		TriggerClientEvent('vd-crew:LoadCrew', source, crew)
		
		showNotification(source, translate.TR_CREATE_CREW .. ' ' .. nameCrew)
	end
end)

RegisterCommand(commands.invitecrew, function(source, args)
	local xPlayers = GetPlayersOnline()
	local players = {}

	for i,k in pairs(xPlayers) do
		local name = getName(k)

		table.insert(players, {name = name, source = k})
	end
	TriggerClientEvent('vd-crew:OpenInviteMenu', source, players)
end)

RegisterCommand(commands.leftcrew, function(source, args)
	local idJ = source
	local crew = GetPlayerCrew(idJ)
	if crew then
		LeftPlayerCrew(idJ, crew.name)
	else
		showNotification(idJ, translate.TR_NOT_HAS)
	end
end)

RegisterCommand(commands.prove, function(source, args)
	local crew = GetPlayerCrew(source)

	local players = {}

	if not crew then
		return
	end

	for i,k in pairs(crew.players) do
		if k.source ~= -1 then
			local name = getName(k.source)
			table.insert(players, {name = name, source = k.source})
		end
	end

	TriggerClientEvent('vd-crew:OpenProveMenu', source, players)
end)

RegisterCommand(commands.demote, function(source, args)
	local crew = GetPlayerCrew(source)

	local players = {}

	if not crew then
		return
	end

	for i,k in pairs(crew.players) do
		if k.source ~= -1 then
			local name = getName(k.source)

			table.insert(players, {name = name, source = k.source})
		end
	end

	TriggerClientEvent('vd-crew:OpenDemoteMenu', source, players)
end)


RegisterCommand(commands.list, function(source, args)
	local crew = GetPlayerCrew(source)

	local players = {}

	if not crew then
		return
	end

	for i,k in pairs(crew.players) do
		if k.source ~= -1 then
			local name = getName(k.source)

			table.insert(players, {grade = k.grade, name = name, source = k.source})
		end
	end

	TriggerClientEvent('vd-crew:OpenListMenu', source, players)
end)

RegisterCommand(commands.kick, function(source, args)
	local crew = GetPlayerCrew(source)
	
	local players = {}

	if not crew then
		return
	end

	TriggerClientEvent('vd-crew:OpenKickMenu', source, crew.players)
end)

RegisterCommand(commands.deletecrew, function(source, args)
	local idJ = source
	local crew, player = GetPlayerCrew(idJ)
	if crew and player.grade == "owner" then
		DeleteCrew(idJ, crew)
	else
		showNotification(idJ, translate.TR_NOT_HAS)
	end
end)

RegisterCommand(commands.ranking, function(source, args)
	if enable_rank then
		_selectranktable(function(result)
			TriggerClientEvent('vd-crew:OpenRanking', source, result)
		end)
	end
end)