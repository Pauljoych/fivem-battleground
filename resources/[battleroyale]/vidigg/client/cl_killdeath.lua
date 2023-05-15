-- RegisterCommand("kill", function()
--   SendNUIMessage({
--       type = "sendKill"
--   })
-- end)

-- RegisterCommand("death", function()
--   SendNUIMessage({
--       type = "sendDeath"
--   })
-- end)

RegisterNetEvent('reset:kill', function()
  SendNUIMessage({
    type = "resetStatus"
})
end)

AddEventHandler('esx:onPlayerDeath', function(data)
  if data.killedByPlayer then
    SendNUIMessage({
      type = "sendDeath"
  })
else
  -- ga ada
  end
end)

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
      if attacker == PPed then
        if victimDied then
              if IsEntityAPed(attacker) then
                SendNUIMessage({
                  type = "sendKill"
              })
              end

          end 
      end

  end

end)