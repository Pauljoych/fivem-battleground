
CreateThread(function()
    while true do 
        count = 0
        for _, playerId in ipairs(GetPlayers()) do
            count = count + 1
            local name = GetPlayerName(playerId)
        end
        Citizen.Wait(500)
        TriggerClientEvent('vidirpc:playercount', -1, count)
        Wait(30000)
    end   
end)