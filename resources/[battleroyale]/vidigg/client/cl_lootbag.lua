
local bags = {}


RegisterNetEvent('vd:dropNewBag', function(tableid, tableInformation)
	local foundGround, zpos = GetGroundZFor_3dCoord(tableInformation["coords"].x, tableInformation["coords"].y, tableInformation["coords"].z)
	bags[tableid] = { 
		["coords"] = {x = tableInformation["coords"].x, y = tableInformation["coords"].y, z = zpos},
		["entityid"] = nil,
		["lootbagid"] = tableid
	}

	if not Config.LootProp then return end
	RequestModel(Config.LootProp)
	while (not HasModelLoaded(Config.LootProp)) do
		Citizen.Wait(1)
	end

	bags[tableid]["entityid"] = CreateObject(Config.LootProp, bags[tableid]["coords"].x, bags[tableid]["coords"].y, bags[tableid]["coords"].z, false, false, false)
	FreezeEntityPosition(bags[tableid]["entityid"], true)
end)

RegisterNetEvent('vd:deleteBag', function(bagid)
	DeleteObject(bags[bagid]["entityid"])
	bags[bagid] = nil
end)

CreateThread(function()
	while true do
		local sleep = 1500
		local ped = PlayerPedId()
		local pCoords = GetEntityCoords(ped)

		for c, v in pairs(bags) do
			local distance = #(pCoords - vector3(v.coords.x, v.coords.y, v.coords.z))
			if distance <= 4.2 then
				sleep = 5
				ESX.Game.Utils.DrawText3D(vector3(v.coords.x, v.coords.y, v.coords.z), "Tekan ~r~[E] ~w~Looting", 1.3)
				if IsControlJustPressed(0, 46) then
					if not IsPedInAnyVehicle(ped, false) then
						if not IsEntityDead(ped) then
							TriggerServerEvent('vd:claimBag', v.lootbagid)
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)

