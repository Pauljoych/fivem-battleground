-- // DIMENSI BATTLE ROYALE \\ -- 
RegisterNetEvent("rc:inbattleroyale", function()
	SetPlayerRoutingBucket(source, 5)
end)

RegisterNetEvent("rc:outbattleroyale", function()
	SetPlayerRoutingBucket(source, 0)
end)