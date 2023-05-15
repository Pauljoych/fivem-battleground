if framework == 1 then

ESX = nil

CreateThread(function()
    while not ESX do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(500)
    end

	if enable_rank then
		_createranktable()
	end

	_createcrewtable(function()
		_selectcrewtable(function(result)
			for i,k in pairs(result) do
				local found = false

				for _, crew in pairs(crews) do
					if crew.name == k.name then
						table.insert(crew.players, {
							identifier = k.identifier,
							source = -1,
							name_player = k.name_player,
							grade = k.grade
						})

						found = true
					end
				end

				if not found then
					table.insert(crews, {
						name = k.name,
						players = {
							{identifier = k.identifier, source = -1, name_player = k.name_player, grade = k.grade}
						}
					})
				end
			end
		end)
	end)
end)

function getIdentifier(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer then
		local identifier = xPlayer.getIdentifier()
    	return identifier
	end
end

function showNotification(source, message)
    -- TriggerClientEvent('esx:showNotification', source, message)
    -- TriggerClientEvent('chat:addMessage', source, { args = { message }})
	TriggerClientEvent('chat:addMessage', source, {template = '<div class="chat-message-crew"><b> </b>' ..message..'</div>',args = { message }})
	
end

function GetPlayersOnline()
	local players = {}
	local g_p = GetPlayers()
	
	for i,k in pairs(g_p) do
		players[i] = tonumber(k)
	end
	
    return players
end

function getName(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    return xPlayer.getName()
end

ESX.RegisterServerCallback('vd-crew:GetCrew', function(src, cb)
    local crew = GetPlayerCrew(src)

    if crew then
        cb(crew)
    else
        cb(nil)
    end
end)

RegisterNetEvent("vd-crew:GetCrew")
AddEventHandler("vd-crew:GetCrew", function(src, cb)
    local crew = GetPlayerCrew(src)

    if crew then
        cb(crew)
    else
        cb(nil)
    end
end)

end