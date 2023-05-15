local currentSafezoneBlip

local currentSafezoneCoord
local currentSafezoneRadius
local targetSafezoneCoord
local targetSafezoneRadius

RegisterNetEvent('brv:setCurrentSafezone')
RegisterNetEvent('brv:setTargetSafezone') 


function ResetSafezone()
    -- body
    print('ResetSafezone')
    currentSafezoneCoord = nil
    currentSafezoneRadius = nil
    targetSafezoneCoord = nil
    targetSafezoneRadius = nil
    
end


function isPlayerOutOfZone()

    local playerPos = GetEntityCoords(GetPlayerPed(PlayerId()))
    local distance = math.abs(GetDistanceBetweenCoords(playerPos.x, playerPos.y, 0, currentSafezoneCoord.x, currentSafezoneCoord.y, 0, false))
  
    return distance > currentSafezoneRadius
  end
 

AddEventHandler('brv:setTargetSafezone', function(tSafezone, timer)

    targetSafezoneCoord = {x=tSafezone.x, y=tSafezone.y, z=tSafezone.z}
   
    targetSafezoneRadius = tSafezone.radius
    -- print('setTargetSafezone : ' .. tostring(targetSafezoneCoord.x) .. ' ' .. tostring(targetSafezoneCoord.y) .. ' ' .. tostring(targetSafezoneCoord.z) .. ' ' .. tostring(targetSafezoneRadius) )
     
    CreateTargetSafezoneBlip(targetSafezoneCoord, targetSafezoneRadius)

    -- showCountdown(timer, 1 , nil)  
end)

local zonajalan = false
local dizonapertama = false
local dizonakedua = false
local dizonaketiga = false
local dizonakeempat = false
local dizonakelima = false
local dizonakeenam = false
local dizonaketerakhir = false

RegisterNetEvent('vidigg:mulaizona7')
AddEventHandler('vidigg:mulaizona7', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kzp21) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp22)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp23)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp24)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp25)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp26)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp27)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp28)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona7')
AddEventHandler('vidigg:mulaizona7', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kzp31) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp32)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp33)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp34)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp35)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp36)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp37)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp38)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona6')
AddEventHandler('vidigg:mulaizona6', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kzp1) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp2)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp3)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp4)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp5)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp6)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp7)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp8)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona5')
AddEventHandler('vidigg:mulaizona5', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kzp11) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp12)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp13)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp14)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp15)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp16)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp17)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp18)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona4')
AddEventHandler('vidigg:mulaizona4', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kzp1) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp2)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp3)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp4)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp5)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp6)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp7)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kzp8)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona3')
AddEventHandler('vidigg:mulaizona3', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.kdz1) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz2)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz3)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz4)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz5)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz6)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz7)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.kdz8)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)


RegisterNetEvent('vidigg:mulaizona2')
AddEventHandler('vidigg:mulaizona2', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.KoordinatZonaPertama1) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKedua2)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKetiga3)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKeempat4)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKelima5)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKeenam6)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKetujuh7)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaTerakhir8)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

RegisterNetEvent('vidigg:mulaizona')
AddEventHandler('vidigg:mulaizona', function()
  local waktu = 60000 * 1
  ESX.ShowNotification("INFO", "Dalam Waktu 1 Menit Zona Akan Muncul ", 5500, 'info')
  Citizen.Wait(waktu) 
  TriggerEvent('brv:setCurrentSafezone', Vidi.KoordinatZonaPertama) 
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  zonajalan = true 
  dizonapertama = true
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKedua)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)  
  dizonakedua = true
  dizonapertama = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKetiga)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonaketiga = true
  dizonapertama = false
  dizonakedua = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKeempat)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakeempat = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakelima = false
  dizonakeenam = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKelima)
  Citizen.Wait(7000)
  dizonakelima = true
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  dizonakelima = true
  dizonapertama = false
  dizonakeenam = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKeenam)
  Citizen.Wait(7000)
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 3 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 3 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 2 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 2 menit")
  Citizen.Wait(waktu)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu) 
  dizonakeenam = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonaketerakhir = false
  ESX.ShowNotification("INFO", "Zona Berpindah", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Berpindah")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaKetujuh)
  Citizen.Wait(7000)  
  ESX.ShowNotification("INFO", "Zona akan pindah dalam waktu 1 menit", 2500, 'info')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona akan pindah dalam waktu 1 menit")
  Citizen.Wait(waktu)
  ESX.ShowNotification("INFO", "Zona Habis", 2500, 'success')
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "Zona Habis")
  TriggerEvent('brv:setTargetSafezone', Vidi.KoordinatZonaTerakhir)
  Wait(10000)
  dizonaketerakhir = true
  dizonapertama = false
  dizonakedua = false
  dizonaketiga = false
  dizonakeempat = false
  dizonakelima = false
  dizonakeenam = false
  TriggerEvent('chatMessage', '^1INFO ', { 255, 255, 255 }, "END")
end)

CreateThread(function()
	while true do
		Wait(Vidi.WaktuDiluarZona)
    if zonajalan == true then
			local playerPed = PlayerPedId()
			local playerPedIsOut = isPlayerOutOfZone(currentSafezoneCoord , currentSafezoneRadius )

        if playerPedIsOut == true then
          if ESX.GetPlayerData().job.name == 'unemployed' then
          local health = GetEntityHealth(playerPed)
          if dizonapertama then
            local newHealth = math.min(health - Vidi.DamageZonaKesatu)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona1: "..newHealth)
          elseif dizonakedua then
            local newHealth = math.min(health - Vidi.DamageZonaKedua)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona2: "..newHealth)

          elseif dizonaketiga then
            local newHealth = math.min(health - Vidi.DamageZonaKetiga)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona3: "..newHealth)

          elseif dizonakeempat then
            local newHealth = math.min(health - Vidi.DamageZonaKeempat)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona4: "..newHealth)

          elseif dizonakelima then
            local newHealth = math.min(health - Vidi.DamageZonaKelima)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona5: "..newHealth)

          elseif dizonakeenam then
            local newHealth = math.min(health - Vidi.DamageZonaKeenam)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona6: "..newHealth)

          elseif dizonaketerakhir then
            local newHealth = math.min(health - Vidi.DamageZonaKeterakhir)
            ESX.ShowNotification("INFO", "Kamu Diluar Zona", 2500, 'info')
            SetEntityHealth(playerPed, newHealth)
            -- print("zona7: "..newHealth)
          end
        end
      end
		else
      -- nothing
    end
  end
end)



-- CreateThread(function()
--   while true do
--     Wait(1)
--     if dizonakelima == true then
--       local playerPed = PlayerPedId()
-- 			local playerPedIsOut = isPlayerOutOfZone(currentSafezoneCoord , currentSafezoneRadius )
      
--         if playerPedIsOut == true then
--           if ESX.GetPlayerData().job.name == 'unemployed' then
--         -- ChangeWeather('SNOWLIGHT') 
--         -- ChangeWeather('BLIZZARD')
--         ChangeWeather('SNOW')
--         NetworkOverrideClockTime(0, 0, 0)
--         else
--           ChangeWeather('EXTRASUNNY')
--           ChangeWeather('CLEAR')
--           NetworkOverrideClockTime(12, 0, 0)
--         end
--       end
--     end
--   end
-- end)

function ChangeWeather(weather)
  ClearOverrideWeather()
  ClearWeatherTypePersist()
  SetWeatherTypePersist(weather)
  SetWeatherTypeNow(weather)
  SetWeatherTypeNowPersist(weather)
end


  
AddEventHandler('brv:setCurrentSafezone', function(cSafezone)
  

    currentSafezoneCoord = {x=cSafezone.x, y=cSafezone.y, z=cSafezone.z}
    currentSafezoneRadius = cSafezone.radius
     
 end)
  


local IsSafezoneArriveAtTarget = true
local TargetSafezoneBlip = nil

function CreateTargetSafezoneBlip(tSafezoneCoord, tSafezoneRadius)

    TargetSafezoneBlip = SetSafeZoneBlip(TargetSafezoneBlip, tSafezoneCoord, tSafezoneRadius, 32)
    SetBlipPriority(TargetSafezoneBlip, 5)
end





--currentSafezone move to targetSafezone update
CreateThread(function()

    local playerOOZAt = nil
    
    
      while true do
    
        if currentSafezoneCoord ~= nil and currentSafezoneRadius ~= nil then
    
            if targetSafezoneCoord ~= nil and targetSafezoneRadius ~= nil then 
    
                if playerOOZAt == nil then 
                    playerOOZAt = GetGameTimer() 
                end
    
                local deltaTime = GetTimeDifference(GetGameTimer(), playerOOZAt) -- deltaTime is ms
                playerOOZAt = GetGameTimer() 
    

                local isArrive = true

                if(GetDistanceBetweenCoords(currentSafezoneCoord.x, currentSafezoneCoord.y, 0, targetSafezoneCoord.x, targetSafezoneCoord.y, 0, false) > 0.1) then
                 
                  currentSafezoneCoord = coord_lerp(currentSafezoneCoord, targetSafezoneCoord, Vidi.ZoneMoveSpeed * ( deltaTime / 5000  ) ) -- deltaTime/1000 <- change milliSecond to second
              
                  isArrive = isArrive and false
                end
            
                if(math.abs( currentSafezoneRadius - targetSafezoneRadius) > 0.1) then
                  currentSafezoneRadius = math.lerp(currentSafezoneRadius, targetSafezoneRadius, Vidi.ZoneRadiusMoveSpeed * ( deltaTime / 5000  ) )
                  
                  isArrive = isArrive and false
                end

                if isArrive == true then
                    RemoveBlip(TargetSafezoneBlip)
                end
            end
       
          
          currentSafezoneBlip = SetSafeZoneBlip(currentSafezoneBlip, currentSafezoneCoord, currentSafezoneRadius, 1)
          SetBlipPriority(currentSafezoneBlip, 1)
        end
    
        Wait(20) -- Wait 30 ms .if you want safezone move more smoothly, Chnage this 20 or 10 
    
      end
    
end)
    

CreateThread(function()
    
      
        while true do
    
          if currentSafezoneCoord ~= nil and currentSafezoneRadius ~= nil then
            DrawMarker(1, currentSafezoneCoord.x, currentSafezoneCoord.y, currentSafezoneCoord.z - 30, 0, 0, 0, 0, 0, 0, currentSafezoneRadius * 2.0, currentSafezoneRadius * 2.0, 250.0, 255, 0, 0, 150, 0, 0, 0, 0, 0, 0, 0)
          end
    
        Wait(0)
        end
    
end)
