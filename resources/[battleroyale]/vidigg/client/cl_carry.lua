-- // function \\ -- 
local function CarryClosetPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _,playerId in ipairs(players) do
        local targetPed = GetPlayerPed(playerId)
        if targetPed ~= playerPed then
			if IsEntityDead(targetPed) then
				local targetCoords = GetEntityCoords(targetPed)
				local distance = #(targetCoords-playerCoords)
				if closestDistance == -1 or closestDistance > distance then
					closestPlayer = playerId
					closestDistance = distance
				end
			end
        end
    end
	if closestDistance ~= -1 and closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end

local function CarryAnimDict(animDict)
    if not HasAnimDictLoaded(animDict) then
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(0)
        end        
    end
    return animDict
end

-- // CARRY ORANG \\ --
local gabisaNembak = false
local carry = {
	InProgress = false,
	targetSrc = -1,
	type = "",
	personCarrying = {
		animDict = "missfinale_c2mcs_1",
		anim = "fin_c2_mcs_1_camman",
		flag = 49,
	},
	personCarried = {
		animDict = "nm",
		anim = "firemans_carry",
		attachX = 0.27,
		attachY = 0.15,
		attachZ = 0.63,
		flag = 33,
	}
}

RegisterCommand("sangattidaksopankamuya",function(source, args)
    if not IsPedDeadOrDying(cache.ped) then
	if not carry.InProgress then
		local closestPlayer = CarryClosetPlayer(3)
		if closestPlayer then
			local targetSrc = GetPlayerServerId(closestPlayer)
			if targetSrc ~= -1 then
				carry.InProgress = true
				carry.targetSrc = targetSrc
				TriggerServerEvent("CarryPeople:sync",targetSrc)
				CarryAnimDict(carry.personCarrying.animDict)
				carry.type = "carrying"
				-- DisablePlayerFiring(cache.ped, true)
                gabisaNembak = true
			else
				--drawNativeNotification("~r~No one nearby to carry!")
				ESX.ShowNotification("INFO", "Tidak ada orang disekitarmu", 2000, 'info')
			end 
		else
			ESX.ShowNotification("INFO", "Tidak ada orang disekitarmu", 2000, 'info')
		end
	else
        gabisaNembak = false
		carry.InProgress = false
		ClearPedSecondaryTask(cache.ped)
		DetachEntity(cache.ped, true, false)
		TriggerServerEvent("CarryPeople:stop",carry.targetSrc)
		carry.targetSrc = 0
	end
end
end,false)

RegisterNetEvent("CarryPeople:syncTarget")
AddEventHandler("CarryPeople:syncTarget", function(targetSrc)
	local targetPed = GetPlayerPed(GetPlayerFromServerId(targetSrc))
	carry.InProgress = true
	CarryAnimDict(carry.personCarried.animDict)
	AttachEntityToEntity(cache.ped, targetPed, 0, carry.personCarried.attachX, carry.personCarried.attachY, carry.personCarried.attachZ, 0.5, 0.5, 180, false, false, false, false, 2, false)
	carry.type = "beingcarried"
    gabisaNembak = true
end)

RegisterNetEvent("CarryPeople:cl_stop")
AddEventHandler("CarryPeople:cl_stop", function()
	carry.InProgress = false
	ClearPedSecondaryTask(cache.ped)
	DetachEntity(cache.ped, true, false)
    gabisaNembak = false
end)

CreateThread(function()
	while true do
		if carry.InProgress then
			if carry.type == "beingcarried" then
				if not IsEntityPlayingAnim(cache.ped, carry.personCarried.animDict, carry.personCarried.anim, 3) then
					TaskPlayAnim(cache.ped, carry.personCarried.animDict, carry.personCarried.anim, 8.0, -8.0, 100000, carry.personCarried.flag, 0, false, false, false)
				end
			elseif carry.type == "carrying" then
				if not IsEntityPlayingAnim(cache.ped, carry.personCarrying.animDict, carry.personCarrying.anim, 3) then
					TaskPlayAnim(cache.ped, carry.personCarrying.animDict, carry.personCarrying.anim, 8.0, -8.0, 100000, carry.personCarrying.flag, 0, false, false, false)
                end
                if gabisaNembak then
                    DisablePlayerFiring(cache.ped, true)
                else
                    DisablePlayerFiring(cache.ped, false)
                end
			end
		end
		Wait(5)
	end
end)

