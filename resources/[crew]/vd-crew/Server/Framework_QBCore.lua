if framework == 2 then

QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
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

-- This function will return the player's identifier (identifier or id)
function getIdentifier(source)
    local Player = QBCore.Functions.GetPlayer(source)
    
    if Player then
        return Player.PlayerData.citizenid
    end
end

-- This function will return the player's name
function getName(source)
    local Player = QBCore.Functions.GetPlayer(source)
    local name = GetPlayerName(source)
    if Player then
        name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    end
    
    return name
end

function showNotification(source, message)
    TriggerClientEvent('QBCore:Notify', source, message)
    TriggerClientEvent('chat:addMessage', source, { args = { message }})
end

function GetPlayersOnline()
    return QBCore.Functions.GetPlayers()
end

end