-- // hitmarker text \\ --
RegisterNetEvent('vidi:s:writehit',  function(attackerid, victim, hit, victimDied, bonehash)
    TriggerClientEvent('vidi:c:writehit', attackerid, victim, hit, victimDied, bonehash)
end)