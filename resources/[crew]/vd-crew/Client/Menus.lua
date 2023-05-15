RegisterCommand(commands.crewmenu, function(source, args)
	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	myItems = {
		{img = "create.png", text = translate.TR_CREATE, text2 = translate.TR_CREATE2, 
		callBack = function()
			local name = InsertValue(translate.TR_CREATE2, '', 20)
			if name and #name > 1 then
				ExecuteCommand(commands.createcrew .. ' ' .. name)
			end
		end},

		{img = "gamer.png", text = translate.TR_JOIN, text2 = translate.TR_JOIN2 .. ' ' .. inviteCrewName, 
		callBack = function()
			ExecuteCommand(commands.joincrew)
		end},

		{img = "invite.png", text =  translate.TR_INVITE, text2 = translate.TR_INVITE2, 
		callBack = function()
			ExecuteCommand(commands.invitecrew)
		end},

		{img = "left.png", text = translate.TR_LEAVE, text2 = translate.TR_LEAVE2, 
		callBack = function()
			ExecuteCommand(commands.leftcrew)
		end},

		{img = "prove.png", text = translate.TR_PROMOTE, text2 = translate.TR_PROMOTE2, 
		callBack = function()
			ExecuteCommand(commands.prove)
		end},

		{img = "demote.png", text = translate.TR_DEMOTE, text2 = translate.TR_DEMOTE2, 
		callBack = function()
			ExecuteCommand(commands.demote)
		end},

		{img = "list.png", text = translate.TR_LIST, text2 = translate.TR_LIST2, 
		callBack = function()
			ExecuteCommand(commands.list)
		end},

		{img = "kick.png", text = translate.TR_KICK_MENU, text2 = translate.TR_KICK_MENU2, 
		callBack = function()
			ExecuteCommand(commands.kick)
		end},
        
		{img = "rank.png", text = translate.TR_RANK, text2 = translate.TR_RANK2, 
		callBack = function()
			ExecuteCommand(commands.ranking)
		end},
	}
	configs = {
		size = 0.8,
		positionY = "30%"
	}

	IconMenu.OpenMenu(myItems, configs)
end)

RegisterNetEvent('vd-crew:OpenInviteMenu')
AddEventHandler('vd-crew:OpenInviteMenu', function(players)
	local myItems = {}

	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	for i,k in pairs(players) do
		table.insert(myItems, {
			img = "gamer.png",
			text = k.name,
			text2 = "Invite " .. k.name,
			callBack = function()
				TriggerServerEvent('vd-crew:InvitePlayer', k.source)
			end
		})
	end

	IconMenu.OpenMenu(myItems)
end)

RegisterNetEvent('vd-crew:OpenKickMenu')
AddEventHandler('vd-crew:OpenKickMenu', function(players)
	local myItems = {}
	
	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	for i,k in pairs(players) do
		table.insert(myItems, {
			img = "gamer.png",
			text = k.name_player,
			text2 = "Kick " .. k.name_player,
			callBack = function()
				TriggerServerEvent('vd-crew:KickPlayer', k.name_player)
			end
		})
	end

	IconMenu.OpenMenu(myItems)
end)

RegisterNetEvent('vd-crew:OpenProveMenu')
AddEventHandler('vd-crew:OpenProveMenu', function(players)
	local myItems = {}

	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	for i,k in pairs(players) do
		table.insert(myItems, {
			img = "gamer.png",
			text = k.name,
			text2 = "Promote " .. k.name,
			callBack = function()
				TriggerServerEvent('vd-crew:ProvePlayer', k.source)
			end
		})
	end

	IconMenu.OpenMenu(myItems)
end)

RegisterNetEvent('vd-crew:OpenDemoteMenu')
AddEventHandler('vd-crew:OpenDemoteMenu', function(players)
	local myItems = {}

	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	for i,k in pairs(players) do
		table.insert(myItems, {
			img = "gamer.png",
			text = k.name,
			text2 = "Demote " .. k.name,
			callBack = function()
				TriggerServerEvent('vd-crew:DemotePlayer', k.source)
			end
		})
	end

	IconMenu.OpenMenu(myItems)
end)

RegisterNetEvent('vd-crew:OpenListMenu')
AddEventHandler('vd-crew:OpenListMenu', function(players)
	local myItems = {}

	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	for i,k in pairs(players) do
		table.insert(myItems, {
			img = "gamer.png",
			text = k.name,
			text2 = k.grade .. " " .. k.name,
			callBack = function()
				
			end
		})
	end

	IconMenu.OpenMenu(myItems)
end)

function InsertValue(title, text, maxsize)
	AddTextEntry('FMMC_KEY_TIP1', title)
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", text, "", "", "", maxsize)

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
		Wait(0)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult()
		Wait(500)
		return result
	else
		Wait(500)
		return nil
	end
end