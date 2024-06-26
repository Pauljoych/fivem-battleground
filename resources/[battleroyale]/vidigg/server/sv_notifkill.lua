local WeaponHashToName = {
  [1046567264] =         "Celurit",
  [-1569615261]=        "Tangan Kosong",
  [2138347493] =       "Firework",
  [-1660422300] =          "MG",
  [-1746263880] =       "Double Action",
  [1119849093] =        "MiniGUN",
  [-72657034] =        "Parachute",
  [1834241177] =        "Railgun",
  [453432689] =        "Pistol",
  [1593441988] =        "Combat Pistol ",
  [-1716589765] =        "Pistol 50 ",
  [-1853920116] =         "Navy Revolver",
  [-1076751822] =        "SNS Pistol ",
  [-771403250] =        "Heavy Pistol ",
  [137902532] =        "Vintage Pistol ",
  [-598887786] =        "Marksman Pistol ",
  [-1045183535] =        "Revolver ",
  [584646201] =        "AP Pistol ",
  [-1075685676] =        "Pistol Mk2 ",
  [-879347409] =        "Python Magnum",
  [-2009644972] =        "SNS Pistol MK2 ",
  [324215364] =        "MicroSMG ",
  [-619010992] =        "Tec-9 ",
  [736523883] =        "SMG ",
  [-270015777] =        "Assault SMG  ",
  [171789620] =        "Combat PDW  ",
  [-1121678507] =        "Mini SMG  ",
  [2024373456] =        "SMG MK2  ",
  [2144741730] =        "M60",
  [-608341376] =        "M60 MK2",
  [-1074790547] =        "Assault Rifle  ",
  [-2084633992] =        "Carbine Rifle ",
  [-1063057011] =        "Special Carbine  ",
  [2132975508] =        "Bullpup Rifle  ",
  [1649403952] =        "Compact Rifle ",
  [961495388] =        "AK-47 MK2  ",
  [-1768145561] =        "Special Carbine MK2  ",
  [-2066285827] =        "Bullpup Rifle MK2  ",
  [205991906] =        "Heavy Sniper  ",
  [-952879014] =        "Marksman Rifle  ",
  [177293209] =        "Heavy Sniper MK2  ",
  [1785463520] =        "Marksman Rifle MK2   ",
  [-86904375] =           "Carbine Rifle MK2",
  [-1466123874] =        "Musket   ",
  [-1654528753] =        "Bullpup Shotgun   ",
  [-1312131151] =        "RPG   ",
  [1672152130] =        "Homing Launcher   ",
}

RegisterServerEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
    data.victim = source
    local ped = GetPlayerPed(data.victim)
    local pedkiller = GetPlayerPed(data.killerServerId)
    local getdarah = GetEntityHealth(pedkiller)
    local getarmor = GetPedArmour(pedkiller)
    local senjata = WeaponHashToName[GetSelectedPedWeapon(pedkiller)]

    if data.killedByPlayer then
	-- TriggerClientEvent('esx:showAdvancedNotification', data.victim, 'LMAO FFA', '', 'Kamu dibunuh oleh ~r~' ..GetPlayerName(data.killerServerId) .. ' ~g~(' ..data.killerServerId.. ')', 'CHAR_LESTER_DEATHWISH', 3)
    -- TriggerClientEvent('shownotif', data.victim, '~r~Darah: ~w~' ..getdarah.. '~w~ | ~b~Armor: ~w~'..getarmor..'~w~ | Jarak: '.. data.distance.. ' Meter | ~r~Senjata: ~y~'.. senjata)
	TriggerClientEvent('shownotif', data.killerServerId,'Kamu membunuh ~r~' ..GetPlayerName(data.victim) ..' ~g~[' ..data.victim.. ']')
    else
		  print('you die')
    end
end)