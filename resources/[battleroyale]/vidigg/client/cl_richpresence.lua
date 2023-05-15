local count = 0

RegisterNetEvent('vidirpc:playercount')
AddEventHandler('vidirpc:playercount', function(pcount)
    count = pcount
end)

CreateThread(function()
    while true do
        local nama = GetPlayerName(PlayerId())

        SetDiscordAppId('1105758139158110260')

        SetDiscordRichPresenceAsset('logo')
        SetDiscordRichPresenceAssetText('Royal Battleground')

        SetDiscordRichPresenceAssetSmall('logo')
        SetDiscordRichPresenceAssetSmallText('Royal Battleground')

        SetRichPresence(count .. '/128 Players | ID : ' .. GetPlayerServerId(PlayerId()))

        SetDiscordRichPresenceAction(0, "Join Game", "fivem://connect/cfx.re/join/d5epmd")
        SetDiscordRichPresenceAction(1, "Join Discord", "https://discord.gg/K7bGGqcmgK")

        Wait(60000)
    end
end)
