ESX.RegisterCommand('resetzone', 'admin', function()
	StopResource('zone')
	TriggerClientEvent('reset:kill', -1)
end, false) 
