local apiURL = "https://raw.githubusercontent.com/vidiggwp/bandatalmao/main/bandatalmao.json"
local discordWebHook = "https://discord.com/api/webhooks/1079402590581821565/DIhRtAjlULObH4_V2NsigewIUxYfSE0lENtQ5XBmZBXPlWOTEcggYOXJXeV5oIjJ4cGd" --Webhook discord untuk notifikasi jika ada player yang terbanned berusaha masuk
local discordWebmasuk = "https://discord.com/api/webhooks/1079402590581821565/DIhRtAjlULObH4_V2NsigewIUxYfSE0lENtQ5XBmZBXPlWOTEcggYOXJXeV5oIjJ4cGd" --Webhook discord untuk notifikasi jika ada player yang terbanned berusaha masuk
local isDataLoaded = false --Jangan diubah
-- // Jika Script Start Check Apakah API Server Online // --
AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == "vidi" then
        print("VIDIGG Test connect to API...")
        discordmasuk()
        checkAPI()
    end
end)

-- // Check API Server Jika Online Maka Akan Mengambil Data Banned Dari Server API // --
function checkAPI()
    PerformHttpRequest(apiURL, function(errorCode, resultData, resultHeaders) 
        if resultData == nil then
            print("VIDIGG API Server is offline, please contact the developer FutureSeeker#1650 (discord) or use command nusantara reload")
        else
            print("VIDIGG Connected to API")
            Wait(5000)
            getBanData()
        end
    end, "GET", json.encode(), {["Content-Type"] = "application/json"})
end

-- // Fungsi Ambil Data Pada Server API // --
function getBanData()
    ListBan = {}
    ResultJson = {}
    -- // Mengambil Data Pada Server API // --
    PerformHttpRequest(apiURL, function(errorCode, resultData, resultHeaders)
        print("VIDIGG Loading ban data...")
        -- // Menyimpan Data Banned Secara Sementara Pada Server (Disimpan Sampai Script Restart/Stop) // --
        ResultJson = json.decode(resultData)
        if ResultJson ~= nil then
          for i=1, #ResultJson["data"], 1 do
              table.insert(ListBan, {
                  license              = ResultJson["data"][i].license,
                  ip                   = ResultJson["data"][i].ip,
                  discord              = ResultJson["data"][i].discord,
                  name                 = ResultJson["data"][i].name,
                  date                 = ResultJson["data"][i].date,
                  steam               = ResultJson["data"][i].steam,
                  hwid                  = ResultJson["data"][i].hwid,
              })
          end
        else
          print("VIDIGG Error loading ban data")
        end
        Wait(5000)
        countBanData()
    end, "GET", json.encode(), {["Content-Type"] = "application/json"})
end

-- // Menghitung Jumlah Ban Data Yang Tersedia // --
function countBanData()
    local count = 0
    if ListBan ~= nil then
        for k,v in pairs(ListBan) do
            count = count + 1
        end
        print("VIDIGG Ban data count: "..count)
        isDataLoaded = true
    end
end

-- // Mengirim Log Discord Jika Ada Player Yang Terdata di Banned Data Berusaha Masuk Ke Kota // --
function discordNotify(name, steam, license, ip, hwid, discord)
  local msg = {["color"] = "15548997", ["type"] = "rich", ["title"] = "Kicked blacklisted player", ["description"] =  "**Name : **" ..name .. "\n **Reason : **" .."Blacklisted Player".. "\n **IP : **||" ..ip.. "||\n **Steam : **||" .. steam .. "||\n **HWID: **||" ..hwid.. "||\n **Rockstar License : **||" .. license .. "||\n **Discord : **<@" .. discord .. ">", ["footer"] = { ["text"] = " © VIDI GG | "..os.date("%c").."" }}
    
  if name ~= "Unknown" then
    PerformHttpRequest(discordWebHook, function(err, text, headers) end, "POST", json.encode({username = "VIDI GG ", embeds = {msg}}), {["Content-Type"] = "application/json"})
  end

end

function discordmasuk()
  local count = 0
    if ListBan ~= nil then
        for k,v in pairs(ListBan) do
            count = count + 1
        end
        isDataLoaded = true
    end
  local msg = {["color"] = "15548997", ["type"] = "rich", ["title"] = "GLOBAL BANNED", ["description"] =  "Started Script", ["footer"] = { ["text"] = " © VIDI GG | "..os.date("%c").."" }}
    
  if name ~= "Unknown" then
    PerformHttpRequest(discordWebmasuk, function(err, text, headers) end, "POST", json.encode({username = "VIDI GG ", embeds = {msg}}), {["Content-Type"] = "application/json"})
  end

end

-- // Event Handler Ketika Player Connect Ke Kota // --
AddEventHandler('playerConnecting', function (playerName,setKickReason)
    if isDataLoaded == true then  
      local license       = nil
      local playerip      = nil
      local playerdiscord = nil
      local hwid        = GetPlayerToken(source, 0)
      local steam       = nil
      local name  = GetPlayerName(source)

      -- // Check Apakah Player Yang Connect Terdata Di Banned Data // --
      for k,v in pairs(GetPlayerIdentifiers(source))do   
        if string.sub(v, 1, string.len("license:")) == "license:" then
          license = v
        elseif string.sub(v, 1, string.len("steam:")) == "steam:" then
          steam  = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
          playerip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
          playerdiscord = v
        end
      end
      
      if playerip == nil then
        playerip = GetPlayerEndpoint(source)
        if playerip == nil then
          playerip = 'Not found'
        end
      end
      if playerdiscord == nil then
        playerdiscord = 'Not found'
      end
      if steam == nil then
        steam = 'Not found'
      end
      if hwid == nil then
          hwid = 'Not found'
      end
      
      if (ListBan == {}) then
        Citizen.Wait(1000)
      end
      
      for i = 1, #ListBan, 1 do
        if not((tostring(ListBan[i].license)) == "Not found" ) and (tostring(ListBan[i].license)) == tostring(license) then
          discordNotify(name, steam, license, playerip, hwid, playerdiscord)
          setKickReason('Anda kena blacklist (Global)')
          CancelEvent()
        end
        if not((tostring(ListBan[i].xbl)) == "Not found") and (tostring(ListBan[i].steam)) == tostring(steam) then
          discordNotify(name, steam, license, playerip, hwid, playerdiscord)
          setKickReason('Anda kena blacklist (Global)')
          CancelEvent()
        end
        if not((tostring(ListBan[i].ip)) == "Not found") and (tostring(ListBan[i].ip))  == tostring(playerip) then
          discordNotify(name, steam, license, playerip, hwid, playerdiscord)
          setKickReason('Anda kena blacklist (Global)')
          CancelEvent()
        end
        if not((tostring(ListBan[i].discord)) == "Not found") and (tostring(ListBan[i].discord)) == tostring(playerdiscord) then
          discordNotify(name, steam, license, playerip, hwid, playerdiscord)
          setKickReason('Anda kena blacklist (Global))')
          CancelEvent()
        end
        if not((tostring(ListBan[i].hwid)) == "Not found" ) and (tostring(ListBan[i].hwid))  == tostring(hwid) then
          discordNotify(name, steam, license, playerip, hwid, playerdiscord)
          setKickReason('Anda kena blacklist (Global)')
          CancelEvent()
        end 
      end
    end
end)

-- // Server Side Command Untuk Reload Ban Data (gunakan di txAdmin Console) // --
RegisterCommand("vidigg", function(source, args, rawCommand)
  if args[1] == nil then 
    print("VIDIGG Silahkan gunakan command ^help^7 untuk melihat daftar command")
  end
  -- If the source is > 0, then that means it must be a player.
  if (source > 0) then
    return false
  -- If it's not a player, then it must be RCON, a resource, or the server console directly.
  else
    if args[1] == "reload" then
      print("VIDIGG Reload Ban Data Command Executed...")
      PerformHttpRequest(apiURL, function(errorCode, resultData, resultHeaders) 
        if resultData ~= nil then
            getBanData()
        else
            print("VIDIGG Error connecting to API")
        end
      end, "GET", json.encode(), {["Content-Type"] = "application/json"})
    end
    if args[1] == "help" then
      print("VIDIGG Daftar Command:")
      print("VIDIGG ^3reload^7 - Reload Ban Data")
    end
  end
end, true)