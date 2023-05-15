ESX.RegisterCommand('mz', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz2', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona2', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz3', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona3', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz4', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona4', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz5', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona5', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz6', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona6', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('mz7', 'admin', function() -- open battle royale pesawatan
    TriggerClientEvent('vidigg:mulaizona7', -1)
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

ESX.RegisterCommand('cz', 'admin', function(_, args) -- open battle royale pesawatan
    TriggerClientEvent('vidigg:customZone', -1, vector3(tonumber(args[1]), tonumber(args[2]), tonumber(args[3])))
    sendToDiscord(16753920, "ZONE SYSTEM", "```Zona telah muncul```", "@Royal Battle Royale")
end, false)

RegisterCommand('mulaizonec', function(source)
    if source == 0 then
        TriggerClientEvent('vidigg:mulaizona', -1)
    end
end)

local webhook = "https://discord.com/api/webhooks/982684208969433198/nIaipPr6Jx6rMbCDLKH0RNB4-Vp8XeI6DooZ4RrXTKOzjlExcDuZzcOYcgdMQKiwi7US"

function sendToDiscord(color, name, message, footer)
    local embed = {{
        ["color"] = color,
        ["title"] = "**" .. name .. "**",
        ["description"] = message,
        ["footer"] = {
            ["text"] = footer
        }
    }}

    PerformHttpRequest(webhook, function(err, text, headers)
    end, 'POST', json.encode({
        username = name,
        embeds = embed
    }), {
        ['Content-Type'] = 'application/json'
    })
end
