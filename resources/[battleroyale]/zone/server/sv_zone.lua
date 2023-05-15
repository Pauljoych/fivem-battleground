ESX.RegisterCommand('czone', 'admin', function(_, args)
    TriggerClientEvent('vidigg:customZone', -1, vector3(tonumber(args[1]), tonumber(args[2]), tonumber(args[3])))
end, false)
