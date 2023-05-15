inviteCrewName = ""
local myCrew = {}

RegisterCommand(commands.joincrew, function(source, args)
	if use_script_in_coordinates then
		if not isInCoordinate() then
			TriggerEvent('chat:addMessage', {args = { translate.TR_NOT_COORDINATE } })
			return
		end
	end

	if inviteCrewName ~= "" then
		TriggerServerEvent("vd-crew:JoinCrew")
	end
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(0) end
	Wait(5000)
    TriggerServerEvent('vd-crew:LoadCrew')

	SendNUIMessage({
        configs = true,
        translate = translate,
        NameResource = GetCurrentResourceName()
    })
end)

AddEventHandler('playerSpawned', function()
	TriggerServerEvent('vd-crew:LoadCrew')
end)

RegisterNetEvent('vd-crew:SendCoords')
AddEventHandler('vd-crew:SendCoords', function(players)	
	if not enable_blips then
		return
	end

	if myCrew and myCrew.players then
		for i,k in pairs(myCrew.players) do
			if k.source ~= -1 and k.blip then
				destroyBlip(k.blip)			
			end
		end
	end

	for i,k in pairs(myCrew.players) do
		for j,c in pairs(players) do
			if c.source == k.source and c.source ~= -1 and GetPlayerFromServerId(k.source) ~= PlayerId() then
				k.coords = c.coords
				k.heading = c.heading
				k.blip = createBlipCoords(vector3(k.coords.x, k.coords.y, k.coords.z), k.heading)
			end
		end
	end
end)

RegisterNetEvent('vd-crew:LoadCrew')
AddEventHandler('vd-crew:LoadCrew', function(crew)
	resetCrew()

	myCrew = crew
end)

RegisterNetEvent('vd-crew:ReceiveInvite')
AddEventHandler('vd-crew:ReceiveInvite', function(crewName)
	inviteCrewName = crewName
end)

RegisterNetEvent('vd-crew:DeletedCrew')
AddEventHandler('vd-crew:DeletedCrew', function()
	resetCrew()
	myCrew = {}
end)

RegisterNetEvent('vd-crew:OpenRanking')
AddEventHandler('vd-crew:OpenRanking', function(result)
	SendNUIMessage({
		openRank = true,
		crews = result
	})
	SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false, false)
	cb('ok')
end)

local alreadyDead = false
CreateThread(function()
	while true and enable_rank do
		if use_script_in_coordinates then
			if isInCoordinate() then
				threadRank()
			end
		else
			threadRank()
		end

		Wait(0)
	end
end)

CreateThread(function()
	while true do
		if use_script_in_coordinates then
			if isInCoordinate() then
				threadNames()
			else
				resetCrew()
			end
		else
			threadNames()
		end

		Wait(1000)
	end
end)

function threadNames()
	local closest, far = getClosestPlayers()

	for i,k in pairs(closest) do
		if enable_names then
			if not k.gamerTag or not IsMpGamerTagActive(k.gamerTag) then
				local player = GetPlayerFromServerId(k.source)
				local ped = GetPlayerPed(player)
				local text = k.name_player

				if show_your_name or player ~= PlayerId() then
					k.gamerTag = createGamerTag(ped, text)
				end
			end
		end

		if enable_blips then
			if not onesync_infinity then
				local player = GetPlayerFromServerId(k.source)
				local ped = GetPlayerPed(player)

				if player ~= PlayerId() then
					if (not k.blip or k.blip == 0) then
						k.blip = createBlip(ped)
					else
						local heading = GetEntityHeading(ped)
						SetBlipRotation(k.blip, math.ceil(heading))
					end
				end
			end
		end
	end

	if enable_names then
		for i,k in pairs(far) do
			if k.gamerTag then
				hideGameTag(k.gamerTag)
				k.gamerTag = nil
			end
		end
	end
end

local alreadyDead = false
function threadRank()
	local myPed = PlayerPedId()
	if IsEntityDead(myPed) and not alreadyDead then
		local killerPed = GetPedSourceOfDeath(myPed)
		if IsEntityAPed(killerPed) and IsPedAPlayer(killerPed) then
			local player = NetworkGetPlayerIndexFromPed(killerPed)
			local sourceKiller = GetPlayerServerId(player)
			
			TriggerServerEvent('vd-crew:AddKillCrew', sourceKiller)
			alreadyDead = true
		end
	end
	if not IsEntityDead(myPed) then
		alreadyDead = false
	end
end

function isInCoordinate()
	local closest = false
	local pos = GetEntityCoords(PlayerPedId())
	for i,k in pairs(coordinates) do
		if #(pos - k) <= range_use then
			closest = true
			break
		end
	end

	return closest
end

function resetCrew()
	if myCrew and myCrew.players then
		for i,k in pairs(myCrew.players) do
			if k.blip then
				destroyBlip(k.blip)
				k.blip = nil
			end

			if k.gamerTag then
				hideGameTag(k.gamerTag)
				k.gamerTag = nil
			end
		end
	end
end

function createGamerTag(ped, text)
	local gamerTag = CreateFakeMpGamerTag(ped, text, false, false, 0)
	SetMpGamerTagVisibility(gamerTag, 0, 1)
	-- SetMpGamerTagHealthBarColor(gamerTag, 0)
	SetMpGamerTagAlpha(gamerTag, 2, 255)
	SetMpGamerTagVisibility(gamerTag, 2, 1)
	-- SetMpGamerTagVisibility(k.gamerTag, 16, 0)

	return gamerTag
	
end

function hideGameTag(gamerTag)
	if gamerTag ~= nil then
		SetMpGamerTagVisibility(gamerTag, 0, 0)		
		SetMpGamerTagVisibility(gamerTag, 2, 0)
		RemoveMpGamerTag(gamerTag)
	end
end

function createBlip(ped)
	local blip = AddBlipForEntity(ped)
	
	SetBlipSprite(blip, sprite_blip)
	SetBlipColour(blip, color_blip)
	SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(myCrew.name)
	EndTextCommandSetBlipName(blip)	
	
	return blip
end

function createBlipCoords(coords, heading)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
	
	SetBlipSprite(blip, sprite_blip)
	SetBlipColour(blip, color_blip)
	SetBlipRotation(blip, math.ceil(heading))

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(myCrew.name)
	EndTextCommandSetBlipName(blip)	
	
	return blip
end

function destroyBlip(blip)
	RemoveBlip(blip)
end

function getClosestPlayers()
	local closest = {}
	local far = {}

	if myCrew and myCrew.players then
		local pos = GetEntityCoords(PlayerPedId())
		local myPlayer = PlayerId()

		for i,k in pairs(myCrew.players) do
			if k.source ~= -1 then
				local player = GetPlayerFromServerId(k.source)
				if(player ~= -1) then
					local ped = GetPlayerPed(player)
					
					if ped then
						table.insert(closest, k)
					else
						table.insert(far, k)
					end	
				else
					table.insert(far, k)
				end
			else
				table.insert(far, k)
			end
		end
	end

	return closest, far
end