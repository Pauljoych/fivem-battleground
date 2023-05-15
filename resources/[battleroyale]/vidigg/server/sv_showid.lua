local onlinePlayers = {}

RegisterServerEvent('vidigg:add-id', function()
    TriggerClientEvent("vidigg:client:add-id", source, onlinePlayers)
    local topText = "undefined " .. Vidi.which
    local identifiers = GetPlayerIdentifiers(source)
    if Vidi.which == "nama" then 
        topText = GetPlayerName(source)
    end
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("vidigg:client:add-id", -1, topText, tostring(source))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)