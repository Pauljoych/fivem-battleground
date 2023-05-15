function handleInitialState()
	local voiceModeData = Cfg.voiceModes[mode]
	MumbleSetTalkerProximity(voiceModeData[1] + 0.0)
	MumbleClearVoiceTarget(voiceTarget)
	MumbleSetVoiceTarget(voiceTarget)
	MumbleSetVoiceChannel(playerServerId)

	while MumbleGetVoiceChannelFromServerId(playerServerId) ~= playerServerId do
		Wait(250)
	end

	MumbleAddVoiceTargetChannel(voiceTarget, playerServerId)

	addNearbyPlayers()
end

AddEventHandler('mumbleConnected', function(address, isReconnecting)
	logger.info('Connected to mumble server with address of %s, is this a reconnect %s', GetConvarInt('voice_hideEndpoints', 1) == 1 and 'HIDDEN' or address, isReconnecting)

	logger.log('Connecting to mumble, setting targets.')
	-- exports['vd-notif']:Icon("Connecting to mumble, setting targets.","right",3500,"teal-10","white",true,"info")
	ESX.ShowNotification("INFO", "Connecting to mumble, setting targets.", 2500, 'info')
	-- don't try to set channel instantly, we're still getting data.
	local voiceModeData = Cfg.voiceModes[mode]
	LocalPlayer.state:set('proximity', {
		index = mode,
		distance =  voiceModeData[1],
		mode = voiceModeData[2],
	}, true)

	handleInitialState()

	logger.log('Finished connection logic')
	-- exports['vd-notif']:Icon("Voice Connected","right",3500,"teal-10","white",true,"info")
	ESX.ShowNotification("INFO", "Voice Connected", 2500, 'info')

end)

AddEventHandler('mumbleDisconnected', function(address)
	logger.info('Disconnected from mumble server with address of %s', GetConvarInt('voice_hideEndpoints', 1) == 1 and 'HIDDEN' or address)
	-- exports['vd-notif']:Icon("Voice Disconnected!","right",3500,"teal-10","white",true,"info")
	ESX.ShowNotification("INFO", "Voice Disconnected!", 2500, 'info')
end)

-- TODO: Convert the last Cfg to a Convar, while still keeping it simple.
AddEventHandler('pma-voice:settingsCallback', function(cb)
	cb(Cfg)
end)

-- RegisterCommand('resetvoice', function()
--     MumbleSetServerAddress(GetConvar('voice_externalAddress', ''), GetConvarInt('voice_externalPort', 0))
-- end, false)