AddEventHandler('playerSpawned', function()
    if not totalplayers then
        Wait(math.random(1500, 4000))
        -- print('true')
        TriggerServerEvent('setjob:unemployed')
    end
end)

AddEventHandler('esx:onPlayerDeath', function()
    if not totalplayers then
        Wait(math.random(1500, 4000))
        -- print('true 2')
        TriggerServerEvent('setjob:mati')
    end
end)