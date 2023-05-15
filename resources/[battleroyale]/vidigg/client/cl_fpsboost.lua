local function fpsmenu()
	lib.registerContext({
		id = 'fpsmenu',
		title = '🔥 FPS Booster Menu',
		options = {
			{
				title = 'Very Low',
				arrow = false,
				description = 'Very Low',
				icon = 'fas fa-skull-crossbones',
				event = 'low',
			},
            {
				title = 'Reset',
				arrow = false,
                description = 'Reset to Default',
				icon = 'fas fa-skull-crossbones',
				event = 'reset',
			},
		}
	})
	lib.showContext('fpsmenu')
end

RegisterCommand('fps', function()
    fpsmenu()
end)

RegisterNetEvent('low', function()
    SetTimecycleModifier('yell_tunnel_nodirect')
    ClearAllBrokenGlass()
    ClearAllHelpMessages()
    LeaderboardsReadClearAll()
    ClearBrief()
    ClearGpsFlags()
    ClearPrints()
    ClearSmallPrints()
    ClearReplayStats()
    LeaderboardsClearCacheData()
    ClearFocus()
    ClearHdArea()
    ClearPedBloodDamage(cache.ped)
    ClearPedWetness(cache.ped)
    ClearPedEnvDirt(cache.ped)
    ResetPedVisibleDamage(cache.ped )
    -- ClearOverrideWeather()
    DisableScreenblurFade()
    SetRainLevel(0.0)
    SetWindSpeed(0.0)
end)

RegisterNetEvent('reset', function()
    SetTimecycleModifier()
    ClearTimecycleModifier()
    ClearExtraTimecycleModifier()
end)