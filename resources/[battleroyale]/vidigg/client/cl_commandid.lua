RegisterCommand('id', function()
    local id = GetPlayerServerId(cache.playerId)
    ESX.ShowNotification('INFO', "ID: " .. id, 2500, 'info')
end)