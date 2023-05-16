ESX.RegisterCommand('czone', 'admin', function(_, args)
    local randomNumTable
    for i = 1, 10, 1 do randomNumTable[i] = math.random(-500, 500) end
    TriggerClientEvent('vidigg:customZone', -1, vector3(tonumber(args[1]), tonumber(args[2]), tonumber(args[3])), randomNumTable)
end, false)

ESX.RegisterCommand('cmode', 'admin', function(xPlayer, args)
    local casterState = {false, true}

    xPlayer.triggerEvent('casterMode', casterState[args[1]])
end, false)
