
local holstered  = true
local blocked	 = false
local PlayerData = {}
------------------------

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	ESX.PlayerLoaded = true
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if blocked then
			DisableControlAction(1, 25, true )
			DisableControlAction(1, 140, true)
			DisableControlAction(1, 141, true)
			DisableControlAction(1, 142, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
			DisablePlayerFiring(ped, true) -- Disable weapon firing
		else
			Citizen.Wait(1000)
		end
	end
end)

-- //  HOLSTER \\ -- 
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local ped = PlayerPedId()

		if PlayerData.job ~= nil and PlayerData.job.name == 'admin' then
			if not IsPedInAnyVehicle(ped, false) then
				if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
					if CheckWeapon(ped) then
						--if IsPedArmed(ped, 4) then
						if holstered then
							blocked   = true
								SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
								loadAnimDict("reaction@intimidation@1h")
								TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 ) -- Change 50 to 30 if you want to stand still when removing weapon
								--TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "intro", 8.0, 2.0, -1, 30, 2.0, 0, 0, 0 ) Use this line if you want to stand still when removing weapon
									Citizen.Wait(100)
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
								--loadAnimDict("rcmjosh4")
								TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
									Citizen.Wait(700)
								ClearPedTasks(ped)
							holstered = false
						else
							blocked = false
						end
					else
					--elseif not IsPedArmed(ped, 4) then
						if not holstered then
							--loadAnimDict("rcmjosh4")
								TaskPlayAnim(ped, "rcmjosh4", "josh_leadout_cop2", 8.0, 2.0, -1, 48, 10, 0, 0, 0 )
									Citizen.Wait(700)
									loadAnimDict("reaction@intimidation@1h")
								TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 ) -- Change 50 to 30 if you want to stand still when holstering weapon
								--TaskPlayAnim(ped, "reaction@intimidation@cop@unarmed", "outro", 8.0, 2.0, -1, 30, 2.0, 0, 0, 0 ) Use this line if you want to stand still when holstering weapon
									Citizen.Wait(60)
								ClearPedTasks(ped)
							holstered = true
						end
					end
				else
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
					Citizen.Wait(100)
				end
			else
				holstered = true
				Citizen.Wait(100)
			end
		else
			if not IsPedInAnyVehicle(ped, false) then
				if GetVehiclePedIsTryingToEnter (ped) == 0 and (GetPedParachuteState(ped) == -1 or GetPedParachuteState(ped) == 0) and not IsPedInParachuteFreeFall(ped) then
					if CheckWeapon(ped) then
						--if IsPedArmed(ped, 4) then
						if holstered then
							blocked   = true
								SetPedCurrentWeaponVisible(ped, 0, 1, 1, 1)
								loadAnimDict("reaction@intimidation@1h")
								TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 5.0, 1.0, -1, 50, 0, 0, 0, 0 )
								--TaskPlayAnim(ped, "reaction@intimidation@1h", "intro", 5.0, 1.0, -1, 30, 0, 0, 0, 0 ) Use this line if you want to stand still when removing weapon
									Citizen.Wait(1250)
								SetPedCurrentWeaponVisible(ped, 1, 1, 1, 1)
									Citizen.Wait(200)
								ClearPedTasks(ped)
							holstered = false
						else
							blocked = false
						end
					else
					--elseif not IsPedArmed(ped, 4) then
						if not holstered then
							loadAnimDict("reaction@intimidation@1h")
								TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 3.0, -1, 50, 0, 0, 0.125, 0 ) -- Change 50 to 30 if you want to stand still when holstering weapon
								--TaskPlayAnim(ped, "reaction@intimidation@1h", "outro", 8.0, 3.0, -1, 30, 0, 0, 0.125, 0 ) Use this line if you want to stand still when holstering weapon
									Citizen.Wait(1700)
								ClearPedTasks(ped)
							holstered = true
						end
					end
				else
					SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
					Citizen.Wait(100)
				end
			else
				holstered = true
				Citizen.Wait(100)
			end
			Citizen.Wait(100)
		end
	end
end)

function CheckWeapon(ped)
	--[[if IsPedArmed(ped, 4) then
		return true
	end]]
	if IsEntityDead(ped) then
		blocked = false
			return false
		else
			for i = 1, #SenjataWhitelisted do
				if GetHashKey(SenjataWhitelisted[i]) == GetSelectedPedWeapon(ped) then
					return true
				end
			end
		return false
	end
end

SenjataWhitelisted = {
	"WEAPON_PISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_REVOLVER",
	"WEAPON_REVOLVER_MK2",
    "WEAPON_DOUBLEACTION",
}


function loadAnimDict(dict)
	while ( not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Citizen.Wait(0)
	end
end