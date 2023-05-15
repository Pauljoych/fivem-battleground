Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118, ["F3"] = 170
}

local FirstSpawn, PlayerLoaded = true, false

IsDead = false

lolkali = false

local cam = nil
local angleY = 0.0
local angleZ = 0.0

local objek = nil

local blipsEms = {}


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	firstSpawn = true
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)


AddEventHandler('playerSpawned', function()
	IsDead = false

	if FirstSpawn then
		exports.spawnmanager:setAutoSpawn(false) -- disable respawn
		FirstSpawn = false

		ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
			if isDead and Config.AntiCombatLog then
				while not ESX.PlayerLoaded do
					Citizen.Wait(1000)
				end

				-- ESX.ShowNotification(_U('combatlog_message'), "info")
			end
		end)
	end
end)

function OnPlayerDeath()
	local playerName = GetPlayerName(PlayerId())

	IsDead = true

	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local formattedCoords = {
        x = ESX.Math.Round(coords.x, 1),
        y = ESX.Math.Round(coords.y, 1),
        z = ESX.Math.Round(coords.z, 1)
    }

	ESX.SetPlayerData('lastPosition', formattedCoords)

	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
	TriggerEvent('esx_inventoryhud:forcekeluar')


	StartDeathTimer()
	ClearPedTasksImmediately(ped)
	SetPedArmour(cache.ped, 0)
	Citizen.Wait(5)
end

function loadAnimDict( dict )
    RequestAnimDict( dict )
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(1)
    end
end



function DrawGenericTextThisFrame()
	SetTextFont(4)
	SetTextProportional(0)
	SetTextScale(0.0, 0.5)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(true)
end

function secondsToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0

	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format("%02.f", math.floor(seconds / 3600))
		local mins = string.format("%02.f", math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format("%02.f", math.floor(seconds - hours * 3600 - mins * 60))

		return mins, secs
	end
end

function StartDeathTimer()
	local canPayFine = false

	if Config.EarlyRespawnFine then
		ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(canPay)
			canPayFine = canPay
		end)
	end

	local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)

	CreateThread(function()
		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(1000)

			if bleedoutTimer > 0 then
				bleedoutTimer = bleedoutTimer - 1
			end
		end
	end)

	CreateThread(function()
		local text, timeHeld

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(0)
			-- DisableAllControlActions(0)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			-- EnableControlAction(0, Keys['E'], true)
			text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))

			-- if IsControlJustReleased(0, Keys['E']) and bleedoutTimer < 500 then
			-- -- if IsControlPressed(0, Keys['E']) and timeHeld > 60 then
			-- 	RemoveItemsAfterRPDeath()
			-- 	break
			-- end

			-- if IsControlPressed(0, Keys['E']) then
			-- 	timeHeld = timeHeld + 1
			-- else
			-- 	timeHeld = 0
			-- end
			DrawGenericTextThisFrame()


			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.9)

		end
			
		if bleedoutTimer < 1 and IsDead then
			RemoveItemsAfterRPDeath()
		end
	end)

	CreateThread(function()
		local text, timeHeld

		-- bleedout timer
		while bleedoutTimer > 0 and IsDead do
			Citizen.Wait(0)
			-- DisableAllControlActions(0)
			EnableControlAction(0, Keys['G'], true)
			EnableControlAction(0, Keys['T'], true)
			EnableControlAction(0, Keys['E'], true)
			EnableControlAction(0, Keys['H'], true)
			EnableControlAction(0, 1, true)
			EnableControlAction(0, 2, true)
			text = "Tekan [~r~H~w~] Jika tidak terlihat"

			DrawGenericTextThisFrame()
			SetTextEntry("STRING")
			AddTextComponentString(text)
			DrawText(0.5, 0.87)

			if IsControlPressed(0, Keys['H']) then
				ClearPedTasksImmediately(PlayerPedId())
				Citizen.Wait(1000)
				--loadAnimDict("dead")
				TaskPlayAnim(PlayerPedId(), "dead", "dead_a", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
			end
		end
	end)
end



function RemoveItemsAfterRPDeath()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)

	Citizen.CreateThread(function()
		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Citizen.Wait(10)
		end

		ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			ESX.SetPlayerData('lastPosition', Config.RespawnPoint.coords)
			ESX.SetPlayerData('loadout', {})

			TriggerServerEvent('esx:updateLastPosition', Config.RespawnPoint.coords)
			RespawnPed(PlayerPedId(), Config.RespawnPoint.coords, Config.RespawnPoint.heading)

			DoScreenFadeIn(800)
		end)
	end)
end

function RespawnPed(ped, coords, heading)
	SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	SetPlayerInvincible(ped, false)
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z)
	ClearPedBloodDamage(ped)

	ESX.UI.Menu.CloseAll()
end


AddEventHandler('esx:onPlayerDeath', function(reason)
	OnPlayerDeath()
	--loadAnimDict("dead")
	SetEntityCoords(PlayerPedId(),GetEntityCoords(PlayerPedId()))
	ClearPedTasksImmediately(PlayerPedId())
	TaskPlayAnim(PlayerPedId(), "dead", "dead_a", 1.0, 1.0, -1, 1, 0, 0, 0, 0)
end)

RegisterNetEvent('esx_ambulancejob:menghidupkan')
AddEventHandler('esx_ambulancejob:menghidupkan', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
	TriggerEvent('esx_ambulancejob:ilang')
	TriggerEvent('esx_basicneeds:resetStatus')

		DoScreenFadeOut(800)

		while not IsScreenFadedOut() do
			Wait(50)
		end

		local formattedCoords = {
			x = ESX.Math.Round(coords.x, 1),
			y = ESX.Math.Round(coords.y, 1),
			z = ESX.Math.Round(coords.z, 1)
		}

		Citizen.Wait(200)
		ESX.SetPlayerData('lastPosition', formattedCoords)
		Citizen.Wait(200)
		RespawnPed(playerPed, formattedCoords, 0.0)

		StopScreenEffect('DeathFailOut')
		DoScreenFadeIn(800)
end)

-- Load unloaded IPLs
if Config.LoadIpl then
	Citizen.CreateThread(function()
		LoadMpDlcMaps()
		EnableMpDlcMaps(true)
		RequestIpl('Coroner_Int_on') -- Morgue
	end)
end

RegisterNetEvent('esx_ambulancejob:receiveReset')
AddEventHandler('esx_ambulancejob:receiveReset', function(state, addTime)
	if state then
		bleedoutTimer = bleedoutTimer + addTime
	end
end)



function DrawText3D1(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextDropShadow(1)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
	DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
	
end

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsDead then
			DisableControlAction(0, 288, true)
			DisableControlAction(0, 289, true)
			DisableControlAction(0, 318, true)
			DisableControlAction(0, 327, true)
			DisableControlAction(0, 182, true)
			DisableControlAction(0, 163, true)
			EnableControlAction(0, Keys['E'], true)
			--EnableControlAction(0, 1, true)
			--EnableControlAction(0, 2, true)
			--[[if IsControlJustReleased(0, Keys['F'], true) then
				ClearPedTasksImmediately(PlayerPedId())
			end]]
		else
			Citizen.Wait(1000)
		end
	end
end)


RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(healType)
	local playerPed = PlayerPedId()
	local maxHealth = GetEntityMaxHealth(playerPed)

	if healType == 'small' then
		local health = GetEntityHealth(playerPed)
		local newHealth = math.min(maxHealth, math.floor(health + maxHealth / 15))
		SetEntityHealth(playerPed, newHealth)
	elseif healType == 'big' then
		SetEntityHealth(playerPed, maxHealth)
	end

	--ESX.ShowNotification(_U('healed'), "info")
end)
------------------------------------------------
----------------------------------------------



--------------------------------------------------
---------------------- LOOP ----------------------
--------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        
        -- process cam controls if cam exists and player is dead
        if (cam and isDead) then
            ProcessCamControls()
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        
        if (not isDead and NetworkIsPlayerActive(PlayerId()) and IsPedFatallyInjured(PlayerPedId())) then
            isDead = true
            
            StartDeathCam()
        elseif (isDead and NetworkIsPlayerActive(PlayerId()) and not IsPedFatallyInjured(PlayerPedId())) then
            isDead = false
            
            EndDeathCam()
        end
    end
end)



--------------------------------------------------
------------------- FUNCTIONS --------------------
--------------------------------------------------

-- initialize camera
function StartDeathCam()
    ClearFocus()

    local playerPed = PlayerPedId()
    
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", GetEntityCoords(playerPed), 0, 0, 0, GetGameplayCamFov())

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

-- destroy camera
function EndDeathCam()
    ClearFocus()

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(cam, false)
    
    cam = nil
end

-- process camera controls
function ProcessCamControls()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    -- disable 1st person as the 1st person camera can cause some glitches
    DisableFirstPersonCamThisFrame()
    
    -- calculate new position
    local newPos = ProcessNewPosition()

    -- focus cam area
    SetFocusArea(newPos.x, newPos.y, newPos.z, 0.0, 0.0, 0.0)
    
    -- set coords of cam
    SetCamCoord(cam, newPos.x, newPos.y, newPos.z)
    
    -- set rotation
    PointCamAtCoord(cam, playerCoords.x, playerCoords.y, playerCoords.z + 0.5)
end

function ProcessNewPosition()
    local mouseX = 0.0
    local mouseY = 0.0
    
    -- keyboard
    if (IsInputDisabled(0)) then
        -- rotation
        mouseX = GetDisabledControlNormal(1, 1) * 8.0
        mouseY = GetDisabledControlNormal(1, 2) * 8.0
        
    -- controller
    else
        -- rotation
        mouseX = GetDisabledControlNormal(1, 1) * 1.5
        mouseY = GetDisabledControlNormal(1, 2) * 1.5
    end

    angleZ = angleZ - mouseX -- around Z axis (left / right)
    angleY = angleY + mouseY -- up / down
    -- limit up / down angle to 90°
    if (angleY > 89.0) then angleY = 89.0 elseif (angleY < -89.0) then angleY = -89.0 end
    
    local pCoords = GetEntityCoords(PlayerPedId())
    
    local behindCam = {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (5.0 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (5.0 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (5.0 + 0.5)
    }
    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, PlayerPedId(), 0)
    local a, hitBool, hitCoords, surfaceNormal, entityHit = GetShapeTestResult(rayHandle)
    
    local maxRadius = 5.0
    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords) < 5.0 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.5, hitCoords)
    end
    
    local offset = {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }
    
    local pos = {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }
    
    
    -- Debug x,y,z axis
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 0, 255, 255, false, false, 2, false, 0, false)
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, 0.0, 90.0, 0.0, 0.03, 0.03, 5.0, 255, 0, 0, 255, false, false, 2, false, 0, false)
    --DrawMarker(1, pCoords.x, pCoords.y, pCoords.z, 0.0, 0.0, 0.0, -90.0, 0.0, 0.0, 0.03, 0.03, 5.0, 0, 255, 0, 255, false, false, 2, false, 0, false)
    
    return pos
end

