RegisterServerEvent('setjob:unemployed')
AddEventHandler('setjob:unemployed', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('unemployed', 0)
end)

RegisterServerEvent('setjob:mati')
AddEventHandler('setjob:mati', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.setJob('mati', 0)
end)