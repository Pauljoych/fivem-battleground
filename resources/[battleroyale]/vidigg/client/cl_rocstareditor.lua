local function OpenRockstarEditor()
	lib.registerContext({
		id = 'rocsktareditor',
		title = '🎥 Rockstar Editor',
		options = {
			{
				title = 'Recording',
				arrow = false,
				description = 'Recording',
				icon = 'fa-solid fa-camera',
				event = 'vidigg:recording',
			},
            {
				title = 'Save Clip & Stop Recording',
				arrow = false,
                description = 'Save Clip & Stop Recording',
				icon = 'fa-solid fa-camera',
				event = 'vidigg:saveclip',
			},
            {
				title = 'Menghapus Rekaman',
				arrow = false,
                description = 'Menghapus Rekaman',
				icon = 'fa-solid fa-camera',
				event = 'vidigg:delclip',
			},
            {
				title = 'Rocktar Editor',
				arrow = false,
                description = 'Rocktar Editor',
				icon = 'fa-solid fa-camera',
				event = 'vidigg:editor',
			},
		}
	})
	lib.showContext('rocsktareditor')
end


RegisterNetEvent("vidigg:recording", function()
    StartRecording(1) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    ESX.ShowNotification('INFO', "Memulai Merekam",  2500, 'info')
end)

RegisterNetEvent("vidigg:saveclip")
AddEventHandler("vidigg:saveclip", function()
    StartRecording(0) -- https://docs.fivem.net/natives/?_0xC3AC2FFF9612AC81
    StopRecordingAndSaveClip() -- https://docs.fivem.net/natives/?_0x071A5197D6AFC8B3
    ESX.ShowNotification('INFO', "Menyimpan Rekaman",  2500, 'info')
end)

RegisterNetEvent("vidigg:delclip")
AddEventHandler("vidigg:delclip", function()
    StopRecordingAndDiscardClip() -- https://docs.fivem.net/natives/?_0x88BB3507ED41A240]
    ESX.ShowNotification('INFO', "Menghapus Rekaman",  2500, 'info')
end)

RegisterNetEvent("vidigg:editor")
AddEventHandler("vidigg:editor", function()
    NetworkSessionLeaveSinglePlayer() -- https://docs.fivem.net/natives/?_0x3442775428FD2DAA
    ActivateRockstarEditor() -- https://docs.fivem.net/natives/?_0x49DA8145672B2725
    ESX.ShowNotification('INFO', "Rockstar Editor Menu",  2500, 'info')
end)

-- [[ Register Command ]] --
RegisterCommand('rockstar', function()
    OpenRockstarEditor()
end)


