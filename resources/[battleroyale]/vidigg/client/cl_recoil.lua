CreateThread(function()
	while true do
		Wait(0)
		local weapon = GetSelectedPedWeapon(cache.ped)
		
		if weapon == GetHashKey("WEAPON_PISTOL50") then
			if IsPedShooting(cache.ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Vidi.RecoilP50)
			end
		end
		
		if weapon == GetHashKey("WEAPON_REVOLVER_MK2") then	
			if IsPedShooting(cache.ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Vidi.RecoilPython) 
			end
		end
		
		if weapon == GetHashKey("WEAPON_DOUBLEACTION") then	
			if IsPedShooting(cache.ped) then
				ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', Vidi.RecoilDA)
			end
		end		
	end
end)
