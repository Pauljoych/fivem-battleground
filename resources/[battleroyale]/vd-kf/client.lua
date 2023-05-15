AddEventHandler('gameEventTriggered', function(name, data)
    if name == "CEventNetworkEntityDamage" then
        victim = tonumber(data[1])
        attacker = tonumber(data[2])
        victimDied = tonumber(data[6]) == 1 and true or false 
        weaponHash = tonumber(data[7])
        isMeleeDamage = tonumber(data[10]) ~= 0 and true or false 
        vehicleDamageTypeFlag = tonumber(data[11]) 
        local FoundLastDamagedBone, LastDamagedBone = GetPedLastDamageBone(victim)
        local bonehash = -1 
        if FoundLastDamagedBone then
            bonehash = tonumber(LastDamagedBone)
        end
        local PPed = PlayerPedId()
        local distance = IsEntityAPed(attacker) and #(GetEntityCoords(attacker) - GetEntityCoords(victim)) or -1
        local isplayer = IsPedAPlayer(attacker)
        local attackerid = isplayer and GetPlayerServerId(NetworkGetPlayerIndexFromPed(attacker)) or tostring(attacker==-1 and " " or attacker)
        local deadid = isplayer and GetPlayerServerId(NetworkGetPlayerIndexFromPed(victim)) or tostring(victim==-1 and " " or victim)
        local victimName = GetPlayerName(PlayerId())
        if victim == PPed then 
            if victimDied then
                if IsEntityAPed(attacker) then
                    TriggerServerEvent('vidi:playerDeath', attackerid, weaponHash, isplayer, bonehash, distance, deadid, victimName)
                else  
                    TriggerServerEvent('vidi:playerDeath', attackerid, weaponHash, isplayer, bonehash, distance, deadid, victimName)
                end

            end 
        end

    end

end)

RegisterNetEvent('vidi:addColumn', function(attackername, weaponHash, victimName, bonehash, distance, attackerid, deadid, combo)
    SendNUIMessage({
        type     = "add",
        aName    = attackername,
        dName    = victimName,
        weapon   = weaponHash,
        bone     = bonehash,
        distance = distance,
        aId      = attackerid,
        dId      = deadid,
        combo    = combo
    })
end)

RegisterNetEvent('vidi:attackP', function(aid, combo)
    SendNUIMessage({
        type = "kill",
        aId  = aid,
        aC   = combo
    })
end)

RegisterNetEvent('vidi:deadP', function(did)
    SendNUIMessage({
        type = "death",
        dId  = did
    })
end)

