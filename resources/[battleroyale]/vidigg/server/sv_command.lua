-- // esx command \\ --
ESX.RegisterCommand('gas', 'admin', function() -- open battle royale ox_lib
	-- StopResource('vd-alive')
	TriggerClientEvent('br:sebelummaen', -1)
	TriggerClientEvent('reset:kill', -1)
	-- StartResource('zone')
	-- Wait(30000)
	-- StartResource('vd-alive')
end, false)

ESX.RegisterCommand('gas2', 'admin', function() -- open battle royale ox_lib
	-- StopResource('vd-alive')
	TriggerClientEvent('br:sebelummaen2', -1)
	TriggerClientEvent('reset:kill', -1)
	-- StartResource('zone')
	-- Wait(30000)
	-- StartResource('vd-alive')
end, false)

ESX.RegisterCommand('stopredzone', 'admin', function() -- open battle royale ox_lib
	TriggerClientEvent('chatMessage', -1, '^1Redzone ', { 255, 255, 255 }, "Redzone Akan Hilang dalam Waktu 1 Menit")
	Wait(60000)
	TriggerClientEvent('chatMessage', -1, '^1Redzone ', { 255, 255, 255 }, "Redzone Akan Hilang dalam Waktu 30 Detik")
	Wait(30000)
	TriggerClientEvent('vidigg:client:RedzoneOFF', -1)
	TriggerClientEvent('chatMessage', -1, '^1Redzone ', { 255, 255, 255 }, "Redzone Hilang")
end, false)

ESX.RegisterCommand('brp', 'admin', function() -- open battle royale pesawatan
	TriggerClientEvent('pesawat:br', -1)
	TriggerClientEvent('reset:kill', -1)
	-- StartResource('zone')	
end, false)

ESX.RegisterCommand('lbr', 'admin', function() -- leave battle royale
	-- StopResource('vd-alive')
	TriggerClientEvent('leave:battleroyale', -1)
	TriggerClientEvent('reset:kill', -1)
	-- StopResource('zone')
end, false) 

ESX.RegisterCommand('resetkill', 'admin', function() -- reset kill / kd
	TriggerClientEvent('reset:kill', -1)
end, false) 

ESX.RegisterCommand('lrz', 'admin', function() -- reset kill / kd
	TriggerClientEvent('vidi:client:ledakanredzone', -1)
end, false) 

ESX.RegisterCommand('brforce', 'admin', function(source, args, user) -- memaksa player untuk membuka menu battle royale. /brforce (id)
	local src = source
	local target = tonumber(args[1])
	local xPlayer = ESX.GetPlayerFromId(target)
	
	if target and xPlayer ~= nil then
		xPlayer.triggerEvent('br:sebelummaen', -1)
	else
		TriggerClientEvent('chatMessage', src, "SYSTEM:", {255, 0, 0}, "Salah.")
		return
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', src, { args = { '^1SYSTEM', 'Tidak memiliki akses.' } })
end, false, {help = '/brforce (ID) - Paksa player'})

ESX.RegisterCommand('pgg', 'admin', function(source, args, user) -- pengumuman manual (timer) | /pgg 10
	TriggerClientEvent('pgg:manual', -1, table.concat(args, " "), "~r~Royal Battleground", 4)
end, false)

ESX.RegisterCommand('pggo', 'admin', function() -- pengumuman otomatis | timer
	TriggerClientEvent('pgg:otomatis', -1)
end, false)


RegisterCommand('gasc', function(source) -- console
    if source == 0 then
		StopResource('vd-alive')
		TriggerClientEvent('br:sebelummaen', -1)
		TriggerClientEvent('reset:kill', -1)
		StartResource('zone')
		Wait(20000)
		StartResource('vd-alive')
    end
end)

RegisterCommand('stopredzonec', function(source) -- console
    if source == 0 then
		TriggerClientEvent('vd-notif:Alert', -1, "INFO", "Redzone Akan Hilang dalam Waktu 2 Menit")
		Wait(60000)
		TriggerClientEvent('vd-notif:Alert', -1, "INFO", "Airdrop Akan Muncul dalam Waktu 1 Menit")
		Wait(60000)
		TriggerClientEvent('vidigg:client:RedzoneOFF', -1)
		TriggerClientEvent('vd-notif:Alert', -1, "INFO", "Redzone Hilang")
    end
end)
 
RegisterCommand('brpc', function(source) -- console
    if source == 0 then
		TriggerClientEvent('pesawat:br', -1)
		TriggerClientEvent('reset:kill', -1)
		StartResource('zone')
    end
end)

RegisterCommand('pggc', function(source, args, user) -- console
    if source == 0 then
		TriggerClientEvent('pgg:manual', -1, table.concat(args, " "), "~r~INFO BATTLE ROYALE", 4)
    end
end)

RegisterCommand('pggoc', function(source) -- console
    if source == 0 then
		TriggerClientEvent('pgg:otomatis', -1)
    end
end)

-- ESX.RegisterCommand(Config.AirdropCommandIngame, 'admin', function() -- pengumuman otomatis | timer
-- 	math.randomseed(GetGameTimer())
-- 	TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 2 Menit")
-- 	TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 2 Menit")
-- 	Wait(1 * 60000)
-- 	TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 1 Menit")
-- 	TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 1 Menit")
-- 	Wait(1 * 60000)
-- 	TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 30 Detik")
-- 	TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 30 Detik")
-- 	Wait(1 * 30000)
-- 	TriggerClientEvent('wais:CreateDrop', -1, math.random(1, #Config.Coords))
-- end, false)

-- RegisterCommand(Config.AirdropCommandConsole, function(source)
--     if source == 0 then
--         math.randomseed(GetGameTimer())
--         TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 2 Menit")
-- 		TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 2 Menit")
--         Wait(1 * 60000)
-- 		TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 1 Menit")
-- 		TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 1 Menit")
-- 		Wait(1 * 60000)
-- 		TriggerClientEvent('chatMessage', -1, '^1LMAO FFA ', { 255, 255, 255 }, "Airdrop Akan Muncul dalam Waktu 30 Detik")
-- 		TriggerClientEvent('vd-notif:Alert', -1, "LMAO FFA", "Airdrop Akan Muncul dalam Waktu 30 Detik")
-- 		Wait(1 * 30000)
--         TriggerClientEvent('wais:CreateDrop', -1, math.random(1, #Config.Coords))
--     end
-- end)



