if framework == 3 then

-- ESX = nil

CreateThread(function()
    -- while not ESX do
    --     TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    --     Wait(500)
    -- end

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
	local identifier = GetPlayerIdentifier(source)

    return identifier
end

function showNotification(source, message)
    -- TriggerClientEvent('esx:showNotification', source, message)
    -- TriggerClientEvent('chat:addMessage', source, { args = { message }})
	TriggerClientEvent('chat:addMessage', source, {template = '<div class="chat-message-crew"><b> </b>' ..message..'</div>',args = { message }})

end

function GetPlayersOnline()
    return GetPlayers()
end

function getName(source)
    local name = GetPlayerName(source)
    return name
end

end