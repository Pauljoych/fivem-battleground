local combo = {}

RegisterServerEvent("vidi:playerDeath", function(attackerid, weaponHash, isplayer, bonehash, distance, deadid, victimName)
    if combo[attackerid] == nil then
        combo[attackerid] = { count = 0 }
    end
    if combo[deadid] == nil then
        combo[deadid] = { count = 0 }
    end

    local _source = source
    local playername = GetPlayerName(_source)
    local attackername = isplayer and GetPlayerName(attackerid) or tostring(attackerid)

    combo[attackerid].count = combo[attackerid].count + 1
    combo[deadid].count = 0

    TriggerClientEvent('vidi:addColumn', -1, attackername, weaponHash, victimName, bonehash, distance, attackerid, deadid, combo[attackerid].count)
    TriggerClientEvent('vidi:attackP', attackerid, attackerid, combo[attackerid].count)
    TriggerClientEvent('vidi:deadP', deadid, deadid)
end)

